import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
// removed dependency on video_thumbnail_imageview; using generated thumbnails instead

import '../../../core/themes/colors.dart';

class GridVideoPlayerWithButton extends StatefulWidget {
  const GridVideoPlayerWithButton({super.key});

  @override
  State<GridVideoPlayerWithButton> createState() =>
      _GridVideoPlayerWithButtonState();
}

class _GridVideoPlayerWithButtonState extends State<GridVideoPlayerWithButton> {
  final List<String> videos = List.generate(
    6,
    (i) =>
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  );

  final Map<int, VideoPlayerController> controllers = {};
  final Map<int, double> videoSizes = {};
  // track whether a video has been started (played) at least once
  final Map<int, bool> hasStarted = {};
  // cached thumbnails (frame images) for videos
  final Map<int, Uint8List?> thumbnails = {};

  Future<double> getVideoSizeMB(String url) async {
    final response = await http.head(Uri.parse(url));
    int bytes = int.tryParse(response.headers["content-length"] ?? "0") ?? 0;
    return bytes / (1024 * 1024);
  }

  Future<void> toggleVideo(int index) async {
    if (!controllers.containsKey(index)) {
      final controller = VideoPlayerController.network(videos[index]);
      await controller.initialize();
      controller.setLooping(true);
      controllers[index] = controller;

      if (!videoSizes.containsKey(index)) {
        double size = await getVideoSizeMB(videos[index]);
        videoSizes[index] = size;
      }

      setState(() {});
    }

    final controller = controllers[index]!;

    // If we are about to play, mark this video as started so thumbnails stop showing
    if (!controller.value.isPlaying) {
      hasStarted[index] = true;
      await controller.play();
    } else {
      controller.pause();
    }

    setState(() {});
  }

  /// Open a full-screen dialog and play the video for [index].
  Future<void> _openVideoDialog(int index) async {
    // ensure controller exists and initialized
    if (!controllers.containsKey(index)) {
      final controller = VideoPlayerController.network(videos[index]);
      await controller.initialize();
      controller.setLooping(true);
      controllers[index] = controller;

      if (!videoSizes.containsKey(index)) {
        double size = await getVideoSizeMB(videos[index]);
        videoSizes[index] = size;
      }
    }

    final controller = controllers[index]!;
    hasStarted[index] = true;
    await controller.play();

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final media = MediaQuery.of(context).size;
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.black,
          child: SizedBox(
            width: media.width,
            height: media.height,
            child: Stack(
              children: [
                // Use AnimatedBuilder to rebuild when controller notifies
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Center(
                      child: controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: VideoPlayer(controller),
                            )
                          : const CircularProgressIndicator(),
                    );
                  },
                ),

                // Close button
                Positioned(
                  top: 40.h,
                  right: 16.w,
                  child: SafeArea(
                    child: IconButton(
                      icon:
                          Icon(Icons.close, color: Colors.white, size: 100.sp),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),

                // Play/Pause button centered near bottom
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        final playing = controller.value.isPlaying;
                        return GestureDetector(
                          onTap: () async {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                            // rebuild handled by AnimatedBuilder
                          },
                          child: Container(
                            padding: EdgeInsets.all(14.w),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              playing ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 100.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // pause when dialog closed
    controller.pause();
    setState(() {});
  }

  /// Generate and cache a thumbnail (single frame) for the given video index.
  /// Uses the `video_thumbnail` package to extract a frame as PNG bytes.
  Future<void> _generateThumbnailIfNeeded(int index) async {
    if (thumbnails.containsKey(index)) return;

    try {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: videos[index],
        imageFormat: ImageFormat.PNG,
        maxWidth: 1280, // specify the width of the thumbnail
        quality: 75,
      );

      thumbnails[index] = uint8list;
      if (mounted) setState(() {});
    } catch (e) {
      // ignore errors - keep thumbnail null so fallback placeholder can be used
      thumbnails[index] = null;
    }
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 60.w,
        mainAxisSpacing: 50.h,
        childAspectRatio: 4.0.sp,
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final controller = controllers[index];
        final isInitialized = controller?.value.isInitialized ?? false;
        final isPlaying = controller?.value.isPlaying ?? false;
        final started = hasStarted[index] ?? false;

        Duration? position;
        Duration? duration;

        if (isInitialized) {
          position = controller!.value.position;
          duration = controller.value.duration;
        }

        Duration? remaining;
        if (position != null && duration != null) {
          remaining = duration - position;
        }

        // show thumbnail if the video has not been started yet (YouTube-like)
        final showThumbnail = !started;

        // prepare the main video/thumbnail widget to avoid collection-if parsing issues
        Widget videoContent;
        if (showThumbnail) {
          if (thumbnails[index] != null) {
            videoContent = Center(
              child: Image.memory(
                thumbnails[index]!,
                width: double.infinity,
                height: 600.h,
                fit: BoxFit.cover,
              ),
            );
          } else {
            videoContent = Center(
              child: FutureBuilder<void>(
                future: _generateThumbnailIfNeeded(index),
                builder: (context, snapshot) {
                  final data = thumbnails[index];
                  if (data != null) {
                    return Image.memory(
                      data,
                      width: double.infinity,
                      height: 600.h,
                      fit: BoxFit.cover,
                    );
                  }
                  // fallback: simple placeholder box with icon
                  return Container(
                    width: double.infinity,
                    height: 600.h,
                    color: Colors.black26,
                    child: Center(
                      child: Icon(Icons.videocam,
                          size: 56.sp, color: Colors.white60),
                    ),
                  );
                },
              ),
            );
          }
        } else if (isInitialized) {
          videoContent = Center(
            child: AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          );
        } else {
          videoContent = Center(
            child: Container(
              width: double.infinity,
              height: 600.h,
              color: Colors.black26,
              child: Center(
                child: Icon(Icons.videocam, size: 56.sp, color: Colors.white60),
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors_App.whiteColor,
          ),
          child: Column(
            children: [
              // ------------------- الفيديو -------------------
              Container(
                height: 600.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.black,
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    // main video / thumbnail widget
                    videoContent,
                    if (!isPlaying)
                      Container(
                        color: Colors.black.withOpacity(0.45),
                      ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () => toggleVideo(index),
                        child: Container(
                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.9),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 8,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                        ),
                      ),
                    ),
                    if (remaining != null)
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 20.h),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _formatDuration(remaining),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // ------- باقي الواجهة كما هي -------
              SizeBoxWidght(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    Text(
                      "مقدمة في القيادة العامة",
                      style: TextStyle(
                          fontSize: 35.sp, fontWeight: FontWeight.w800),
                    ),
                    Spacer(),
                    Container(
                      width: 130.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: Colors_App.greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        'منشور',
                        style: TextStyle(
                            fontSize: 30.sp, color: Colors_App.greyColor),
                      ),
                    ),
                  ],
                ),
              ),

              SizeBoxWidght(height: 30.h),
              Row(
                children: [
                  SizeBoxWidght(width: 30.w),
                  Container(
                    width: 130.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Colors_App.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.r)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'اساسي',
                      style: TextStyle(
                          fontSize: 30.sp, color: Colors_App.primaryColor),
                    ),
                  ),
                  SizeBoxWidght(width: 30.w),
                  Text(
                    "24 مشاهدة",
                    style: TextStyle(fontSize: 27.sp),
                  ),
                ],
              ),

              SizeBoxWidght(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    Text(
                      videoSizes[index] != null
                          ? "${videoSizes[index]!.toStringAsFixed(2)} MB"
                          : "—",
                      style: TextStyle(fontSize: 27.sp),
                    ),
                    Spacer(),
                    Text('2023/2/3', style: TextStyle(fontSize: 27.sp)),
                  ],
                ),
              ),

              SizeBoxWidght(height: 50.h),
              Row(
                children: [
                  SizeBoxWidght(width: 30.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _openVideoDialog(index),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: Colors_App.whiteColor,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors_App.blackColor,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ],
                            border: Border.all(
                                color: Colors_App.blackColor.withOpacity(0.3))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_red_eye, size: 50.sp),
                            SizeBoxWidght(width: 30.w),
                            Text('عرض', style: TextStyle(fontSize: 40.sp))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizeBoxWidght(width: 30.w),
                  Container(
                    width: 130.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors_App.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors_App.blackColor,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ],
                        border: Border.all(
                            color: Colors_App.blackColor.withOpacity(0.3))),
                    child: Center(
                      child: Icon(Icons.edit, size: 50.sp),
                    ),
                  ),
                  SizeBoxWidght(width: 30.w),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: Container(
                      width: 150.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Colors_App.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors_App.blackColor,
                                blurRadius: 1,
                                offset: Offset(0, 0))
                          ],
                          border: Border.all(
                              color: Colors_App.blackColor.withOpacity(0.3))),
                      child: Center(
                        child: Icon(
                          Icons.delete,
                          size: 50.sp,
                          color: Colors_App.redColor,
                        ),
                      ),
                    ),
                  ),
                  SizeBoxWidght(
                    width: 30.w,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
