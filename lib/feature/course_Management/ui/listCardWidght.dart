import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class ListCardWidght extends StatelessWidget {
  const ListCardWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardTopWidght(),
        CardTopWidght(
          title: 'الدورات النشطة',
          numberCourses: '75',
          iconData: Icons.play_circle_fill,
          iconColor: Colors_App.greyColor,
          backgroundIconColor: Colors_App.greyColor.withOpacity(0.4),
        ),
        CardTopWidght(
          title: 'الدورات المكتملة',
          numberCourses: '15',
          iconData: Icons.check_circle_outline,
          iconColor: Colors_App.redColor,
          backgroundIconColor: Colors_App.redColor.withOpacity(0.4),
        ),
        CardTopWidght(
          title: 'الدورات القادمة',
          numberCourses: '10',
          iconData: Icons.schedule,
          iconColor: Colors_App.blackColor,
          backgroundIconColor: Colors_App.blackColor.withOpacity(0.4),
        ),
      ],
    );
  }
}

class CardTopWidght extends StatelessWidget {
  const CardTopWidght({
    super.key,
    this.title,
    this.numberCourses,
    this.iconData,
    this.iconColor,
    this.backgroundIconColor,
  });
  final String? title;
  final String? numberCourses;
  final IconData? iconData;
  final Color? iconColor;
  final Color? backgroundIconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors_App.whiteColor),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(Size(950.w, 600.h)),
        maximumSize: MaterialStateProperty.all(Size(950.w, 600.h)),
      ),
      child: Container(
        margin: EdgeInsets.all(50.w),
        width: 900.w,
        height: 500.h,
        decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: backgroundIconColor ??
                    Colors_App.primaryColor.withOpacity(0.4),
              ),
              child: Icon(
                iconData ?? Icons.library_books,
                size: 70.sp,
                color: iconColor ?? Colors_App.primaryColor,
              ),
            ),
            Text(
              numberCourses ?? '90',
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
              ),
            ),
            Text(
              title ?? 'إجمالي الدورات',
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors_App.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
