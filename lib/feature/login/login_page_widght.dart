import 'package:drivesmart/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/sizebox_widght.dart';
import 'ui/ContainerCenterWidgth.dart';
import 'ui/TopTextWidght.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'en';
    final textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
    bool valueCheckBox = false;
    return Scaffold(
      backgroundColor: Colors_App.primaryColor,
      body: Center(
        child: Container(
          width: 1310.w,
          height: 2540.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 130.r,
                child: Icon(
                  Icons.security,
                  size: 100.sp,
                  color: Colors_App.primaryColor,
                ),
              ),
              SizeBoxWidght(
                height: 50.h,
              ),
              const TextAppBarWidght(),
              SizeBoxWidght(
                height: 10.h,
              ),
              ContainerCenterWidgth(
                isArabic: isArabic,
                textDirection: textDirection,
                valueCheckBox: valueCheckBox,
              ),
              SizeBoxWidght(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                child: Text(
                  'مدرسة التفوق الخاصه @ 2025 جميع الحقوق محفوظه',
                  style: TextStyle(
                      color: Colors_App.whiteColor.withOpacity(0.6),
                      fontSize: 35.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
