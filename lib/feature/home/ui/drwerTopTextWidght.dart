import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class DrwerTopTextWidght extends StatelessWidget {
  const DrwerTopTextWidght({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.radius,
  });
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 600.w,
          height: 200.h,
          child: ListTile(
            title: Text(
              title ?? 'مدرسة التفوق الخاصة',
              style: TextStyle(fontSize: 46.sp),
            ),
            subtitle: Text(
              subtitle ?? 'لوحة التحكم الادارة',
              style: TextStyle(fontSize: 36.sp),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(60.0.sp),
          child: Container(
            width: 180.w,
            height: 180.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors_App.primaryColor,
              borderRadius: BorderRadius.circular(radius ?? 50.r),
            ),
            child: Icon(
              icon ?? Icons.security_outlined,
              color: Colors_App.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
