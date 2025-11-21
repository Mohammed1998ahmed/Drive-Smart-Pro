import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class cardDetailsWidght extends StatelessWidget {
  const cardDetailsWidght({
    super.key,
    this.active,
    this.basic,
    this.colorActive,
    this.title,
    this.description,
    this.price,
    this.duration,
    this.numberPerson,
    this.Lessons,
    this.practical,
    this.theoretical,
    this.onPressedDeseploy,
    this.onPressedDelete,
    this.onPressedEdit,
  });
  final String? active;
  final String? basic;
  final Color? colorActive;
  final String? title;
  final String? description;
  final String? price;
  final String? duration;
  final String? numberPerson;
  final String? Lessons;
  final String? practical;
  final String? theoretical;
  final void Function()? onPressedDeseploy;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      height: 1300.h,
      decoration: BoxDecoration(
        color: Colors_App.whiteColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopCardCoursesWidght(
            active: active,
            colorActive: colorActive,
            typeCourse: basic,
            title: title,
            description: description,
          ),
          SizeBoxWidght(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '\$ ' + 'السعر ',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors_App.blackColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      price ?? '150,000 ل.س',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors_App.blackColor,
                      ),
                    ),
                  ],
                ),
                SizeBoxWidght(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      '\⌚ ' + 'المدة ',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors_App.blackColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      duration ?? '20 حصة',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors_App.blackColor,
                      ),
                    ),
                  ],
                ),
                SizeBoxWidght(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      '🧑' + 'الطلاب ',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors_App.blackColor,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(20.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors_App.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        numberPerson ?? '150 طالب',
                        style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors_App.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizeBoxWidght(
                  height: 120.h,
                ),
                Container(
                  width: ScreenUtil().screenWidth * 0.26,
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: Colors_App.lightWhiteColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تفصيل الحصة:',
                          style: TextStyle(
                              fontSize: 40.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  Lessons ?? '20',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                                Text(
                                  'إجمالي',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  practical ?? '12',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                                Text(
                                  'عملي',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  theoretical ?? '8',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                                Text(
                                  'نظري',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizeBoxWidght(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors_App.whiteColor),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: onPressedDeseploy,
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors_App.lightWhiteColor2, width: 2.w),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'عرض',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35.sp, color: Colors_App.blackColor),
                        ),
                      ),
                    )),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors_App.whiteColor),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: onPressedEdit,
                      child: Container(
                        width: ScreenUtil().screenWidth * 0.03,
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors_App.lightWhiteColor2, width: 2.w),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors_App.blackColor,
                            size: 50.sp,
                          ),
                        ),
                      ),
                    ),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    ElevatedButton(
                      onPressed: onPressedDelete,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors_App.whiteColor),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Container(
                        width: ScreenUtil().screenWidth * 0.03,
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors_App.lightWhiteColor2, width: 2.w),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors_App.redColor,
                            size: 50.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopCardCoursesWidght extends StatelessWidget {
  const TopCardCoursesWidght({
    super.key,
    this.active,
    this.typeCourse,
    this.colorActive,
    this.title,
    this.description,
  });
  final String? active;
  final Color? colorActive;
  final String? typeCourse;
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors_App.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 200.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: colorActive ?? Colors_App.greyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      active ?? 'نشطة',
                      style: TextStyle(
                          fontSize: 35.sp, color: Colors_App.whiteColor),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 200.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors_App.whiteColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      typeCourse ?? 'أساسي',
                      style: TextStyle(
                          fontSize: 35.sp, color: Colors_App.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
            SizeBoxWidght(
              height: 15.h,
            ),
            Text(
              title ?? 'دورة القيادة الأساسية',
              style: TextStyle(
                  fontSize: 35.sp,
                  color: Colors_App.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description ?? 'تعليم أساسيات القيادة للمبتدئين',
              style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors_App.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
