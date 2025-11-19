import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class CardTopWidght extends StatelessWidget {
  const CardTopWidght({
    super.key,
    this.nameText,
    this.numberText,
    this.colorText,
    this.subString,
  });
  final String? nameText;
  final String? numberText;
  final Color? colorText;
  final String? subString;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * 0.18,
      height: 300.h,
      decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          borderRadius: BorderRadius.circular(30.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  nameText ?? 'إجمالي الحجوزات',
                  style: TextStyle(
                    fontSize: 40.sp,
                  ),
                ),
                Spacer(),
                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: colorText ?? Colors_App.primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    numberText ?? '6',
                    style: TextStyle(
                        fontSize: 30.sp, color: Colors_App.whiteColor),
                  ),
                )
              ],
            ),
            SizeBoxWidght(height: 80.h),
            Text(
              subString ?? "اليوم والأيام القادمة",
              style: TextStyle(
                fontSize: 45.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
