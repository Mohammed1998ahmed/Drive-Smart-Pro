import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PdfCardGrid extends StatelessWidget {
  const PdfCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // عدد الكروت في الصف
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2.0.sp, // للتحكم بشكل الكرت
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------- صورة الكرت --------------------
              Container(
                height: 900.sp,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Center(
                  child: Icon(Icons.image_outlined,
                      color: Colors.white, size: 60.sp),
                ),
              ),

              SizeBoxWidght(
                height: 30.h,
              ),

              // -------------------- حالة المنشور --------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Colors.green.withOpacity(0.15)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    index % 2 == 0 ? "منشور" : "مسودة",
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: index % 2 == 0 ? Colors.green : Colors.grey[700],
                    ),
                  ),
                ),
              ),

              SizeBoxWidght(
                height: 30.h,
              ),
              // -------------------- العنوان --------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "عنوان المحتوى $index",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
              ),

              SizeBoxWidght(
                height: 30.sp,
              ),

              // -------------------- نوع المحتوى --------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    "تعليمي",
                    style: TextStyle(color: Colors.blue, fontSize: 30.sp),
                  ),
                ),
              ),

              SizeBoxWidght(height: 30.h),
              // -------------------- التاريخ والحجم --------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2025/1/2",
                        style: TextStyle(
                            fontSize: 30.sp, color: Colors.grey.shade600)),
                    Text("KB 250",
                        style: TextStyle(
                            fontSize: 30.sp, color: Colors.grey.shade600)),
                  ],
                ),
              ),

              // -------------------- أزرار الحذف والعرض --------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Row(
                  children: [
                    // زر حذف
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),

                    SizeBoxWidght(
                      width: 15.w,
                    ),
                    // زر عرض
                    Expanded(
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("عرض",
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Colors.grey.shade600)),
                              SizeBoxWidght(
                                width: 20.w,
                              ),
                              Icon(Icons.remove_red_eye_outlined, size: 20),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
