import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class TopTextWidght extends StatelessWidget {
  const TopTextWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizeBoxWidght(
            height: 40.h,
          ),
          Text(
            'تسجيل دخول الادارة',
            style: TextStyle(color: Colors_App.blackColor, fontSize: 45.sp),
          ),
          Text(
            'ادخال البانات للوصول الى لوحه التحكم',
            style: TextStyle(
                color: Colors_App.blackColor.withOpacity(0.8), fontSize: 40.sp),
          ),
        ],
      ),
    );
  }
}

class TextAppBarWidght extends StatelessWidget {
  const TextAppBarWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'مدرسة التفوق الخاصة',
            style: TextStyle(color: Colors_App.whiteColor, fontSize: 40.sp),
          ),
          Text(
            'نظام ادارة تعلم القيادة',
            style: TextStyle(color: Colors_App.whiteColor, fontSize: 45.sp),
          ),
        ],
      ),
    );
  }
}
