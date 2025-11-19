import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class TopAppBarWidght extends StatelessWidget {
  const TopAppBarWidght({
    super.key,
    this.trailing,
  });
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'إدارة الحجوزات',
        style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'عرض وإدارة حجوزات الحصص',
        style: TextStyle(fontSize: 40.sp, color: Colors_App.blackColor),
      ),
      trailing: trailing ??
          Container(
            width: ScreenUtil().screenWidth * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ElevatedButtonWidght(),
                SizeBoxWidght(
                  width: 10.w,
                ),
                const ElevatedButtonWidght(
                  color: Colors_App.whiteColor,
                  colorIcon: Colors_App.blackColor,
                  iconData: Icons.download,
                  nameText: 'تصدير',
                  colorText: Colors_App.blackColor,
                )
              ],
            ),
          ),
    );
  }
}

class ElevatedButtonWidght extends StatelessWidget {
  const ElevatedButtonWidght({
    super.key,
    this.nameText,
    this.iconData,
    this.color,
    this.colorIcon,
    this.colorText,
  });
  final String? nameText;
  final IconData? iconData;
  final Color? color;
  final Color? colorIcon;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(color ?? Colors_App.primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.h),
        ),
      ),
      onPressed: () {},
      child: Container(
        width: 300.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: color ?? Colors_App.primaryColor,
            borderRadius: BorderRadius.circular(30.r)),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              iconData ?? Icons.add,
              color: colorIcon ?? Colors_App.whiteColor,
              size: 50.sp,
            ),
            Text(
              nameText ?? 'إضافة مستخدم',
              style: TextStyle(
                  fontSize: 33.sp,
                  color: colorText ?? Colors_App.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
