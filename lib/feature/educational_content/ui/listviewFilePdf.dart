import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'dart:html' as html;

import 'package:path_provider/path_provider.dart';

// ------------------- دعم الويب فقط --------------------
// import 'web_pdf_opener.dart'
// if (dart.library.html) 'web_pdf_opener_web.dart';
// -----------------------------------------------------

// Future<String> downloadPDF(String url, String fileName) async {
//   if (kIsWeb) {
//     return url; // في الويب لن نقوم بتنزيل الملف
//   }

//   final directory = await Directory.systemTemp.createTemp();
//   final savePath = "${directory.path}/$fileName";

//   await Dio().download(url, savePath);

//   return savePath;
// }
Future<String> downloadPDF(String url, String fileName) async {
  if (kIsWeb) {
    // تنزيل الملف على الويب (المتصفح يقوم بوضعه في التنزيلات)
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    return url;
  }

  // موبايل + سطح المكتب
  Directory? downloadsDir;

  // أولاً نحاول مسار التنزيلات الحقيقي
  try {
    downloadsDir =
        await getDownloadsDirectory(); // يعمل على ويندوز/ماك/لينكس فقط
  } catch (e) {
    downloadsDir = null;
  }

  // إن لم يعمل (على الموبايل مثلاً) نستخدم Documents كبديل
  downloadsDir ??= await getApplicationDocumentsDirectory();

  final savePath = "${downloadsDir.path}/$fileName";

  await Dio().download(url, savePath);

  return savePath;
}

void openWebPDF(String url) {
  html.window.open(url, "_blank");
}

void openPDFInside(BuildContext context, String path) {
  if (kIsWeb) {
    openWebPDF(path); // يفتح في تبويب جديد
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String path;
  const PDFViewerPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("عرض الملف")),
      body: PDFView(filePath: path),
    );
  }
}

List<String> pdfLinks = [
  "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
  "https://gahp.net/wp-content/uploads/2017/09/sample.pdf",
  "https://www.africau.edu/images/default/sample.pdf",
  "https://www.orimi.com/pdf-test.pdf",
  "https://www.hq.nasa.gov/alsj/a17/A17_FlightPlan.pdf",
  "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
  "https://file-examples.com/storage/fe415b83fe0695adf7b2e63/2017/10/file-example_PDF_1MB.pdf",
];

class FilePdfWidght extends StatelessWidget {
  const FilePdfWidght({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 60.w,
          mainAxisSpacing: 50.h,
          childAspectRatio: 4.5.sp,
        ),
        itemCount: pdfLinks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 130.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: Colors_App.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.picture_as_pdf,
                          color: Colors_App.primaryColor,
                          size: 50.sp,
                        ),
                      ),
                    ),
                    title: Text(
                      'دور القيادة الاساسية',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 100.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors_App.greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            'منشور',
                            style: TextStyle(
                              color: Colors_App.greyColor,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text('النوع', style: TextStyle(fontSize: 35.sp)),
                      Spacer(),
                      Container(
                        width: 100.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors_App.redColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            'PDF',
                            style: TextStyle(
                              color: Colors_App.redColor,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizeBoxWidght(height: 30.h),
                  Row(
                    children: [
                      Text('الصفحات', style: TextStyle(fontSize: 35.sp)),
                      Spacer(),
                      Text('145', style: TextStyle(fontSize: 35.sp)),
                    ],
                  ),
                  SizeBoxWidght(height: 30.h),
                  Row(
                    children: [
                      Text('التحميلات', style: TextStyle(fontSize: 35.sp)),
                      Spacer(),
                      Text('45', style: TextStyle(fontSize: 35.sp)),
                    ],
                  ),
                  SizeBoxWidght(height: 30.h),
                  Row(
                    children: [
                      Text('الحجم', style: TextStyle(fontSize: 35.sp)),
                      Spacer(),
                      Text('4 MB', style: TextStyle(fontSize: 35.sp)),
                    ],
                  ),
                  SizeBoxWidght(height: 30.h),
                  Container(
                    width: ScreenUtil().screenWidth * 0.3,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors_App.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        'أساسي',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizeBoxWidght(height: 30.h),
                  Row(
                    children: [
                      // زر تحميل
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            String url = pdfLinks[index];

                            if (kIsWeb) {
                              openWebPDF(url); // يفتح PDF مباشرة
                              return;
                            }

                            String filePath =
                                await downloadPDF(url, "file_$index.pdf");

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("تم تحميل الملف")),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.download,
                                      color: Colors_App.blackColor,
                                      size: 60.sp),
                                  SizeBoxWidght(width: 20.w),
                                  Text('تحميل',
                                      style: TextStyle(fontSize: 35.sp)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizeBoxWidght(width: 20.w),

                      // زر عرض
                      ElevatedButton(
                        onPressed: () async {
                          String url = pdfLinks[index];
                          String filePath =
                              await downloadPDF(url, "file_$index.pdf");

                          openPDFInside(context, filePath);
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        child: Container(
                          width: 170.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.visibility,
                              color: Colors_App.blackColor,
                              size: 60.sp,
                            ),
                          ),
                        ),
                      ),

                      SizeBoxWidght(width: 30.w),

                      // زر حذف (كما هو)
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        child: Container(
                          width: 170.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors_App.redColor,
                              size: 60.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
