import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class CardPostWidght extends StatelessWidget {
  const CardPostWidght({
    super.key,
    this.title,
    this.subtitle,
    this.numberPost,
    this.iconData,
    this.iconColor,
    this.backgroundColorIcon,
    this.backgroundColorNumberPost,
  });
  final String? title;
  final String? subtitle;
  final String? numberPost;
  final IconData? iconData;
  final Color? iconColor;
  final Color? backgroundColorIcon;
  final Color? backgroundColorNumberPost;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Container(
          width: 800.w,
          height: 450.h,
          decoration: BoxDecoration(
              color: Colors_App.whiteColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: EdgeInsets.all(30.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: backgroundColorIcon ??
                              Colors_App.redColor.withOpacity(0.3)),
                      child: Icon(
                        iconData ?? Icons.video_call,
                        color: iconColor ?? Colors_App.redColor,
                        size: 70.sp,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 100.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color:
                              backgroundColorNumberPost ?? Colors_App.redColor),
                      child: Text(
                        numberPost ?? '40',
                        style: TextStyle(
                            color: Colors_App.whiteColor, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
                SizeBoxWidght(
                  height: 60.h,
                ),
                Text(
                  title ?? 'الفيديوهات',
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w800),
                ),
                SizeBoxWidght(
                  height: 20.h,
                ),
                Text(
                  subtitle ?? '3 منشورات',
                  style: TextStyle(
                    fontSize: 35.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
