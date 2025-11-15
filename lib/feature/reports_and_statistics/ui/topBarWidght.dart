import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class TopBarWidght extends StatelessWidget {
  const TopBarWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'التقارير و الايرادات',
        style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'نلحليل مالي شامل للنظام والتقارير الدورية',
        style: TextStyle(fontSize: 40.sp),
      ),
      trailing: Container(
        width: 1100.w,
        child: Row(
          children: [
            const ButtonTopBarWidght(),
            SizedBox(width: 20.w),
            const ButtonTopBarWidght(
              color_Button: Colors_App.whiteColor,
              color_Text: Colors_App.blackColor,
              color_Icon: Colors_App.blackColor,
              iconData: Icons.filter_list,
              nameButtom: 'تصفية البيانات',
            )
          ],
        ),
      ),
    );
  }
}

class ButtonTopBarWidght extends StatelessWidget {
  const ButtonTopBarWidght({
    super.key,
    this.color_Button,
    this.color_Text,
    this.iconData,
    this.nameButtom,
    this.color_Icon,
  });
  final Color? color_Button;
  final Color? color_Text;
  final Color? color_Icon;
  final IconData? iconData;
  final String? nameButtom;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      height: 100.h,
      decoration: BoxDecoration(
          color: color_Button ?? Colors_App.primaryColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData ?? Icons.download,
              color: color_Icon ?? Colors_App.whiteColor,
              size: 50.sp,
            ),
            Text(
              nameButtom ?? 'تصدير التقارير',
              style: TextStyle(
                  fontSize: 40.sp, color: color_Text ?? Colors_App.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
