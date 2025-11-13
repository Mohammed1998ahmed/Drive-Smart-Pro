import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class AppBarDashBord extends StatelessWidget {
  const AppBarDashBord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "لوحة التحكم الرئيسية ",
              style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              " مرحبا بك ,نظرة عامع على نشاط النظام",
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 130.w,
          height: 130.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors_App.whiteColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30.r)),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              const Icon(Icons.notifications_active_outlined),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors_App.redColor,
              )
            ],
          ),
        ),
        SizeBoxWidght(
          width: 60.w,
        ),
        Container(
          width: 500.w,
          height: 80.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors_App.greyColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r)),
          child: Text(
            'النظام يعمل بشكل صحيح',
            style: TextStyle(
                fontSize: 35.sp,
                fontWeight: FontWeight.w800,
                color: Colors_App.greyColor),
          ),
        )
      ],
    );
  }
}
