import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class textFromFeildWidght extends StatelessWidget {
  const textFromFeildWidght({
    super.key,
    required this.textDirection,
    required this.isArabic,
    required this.hintText,
    this.icon,
    this.suffixIcon,
  });

  final TextDirection textDirection;
  final bool isArabic;
  final String hintText;
  final IconData? icon;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.sp),
      child: SizedBox(
        height: 180.h,
        child: TextFormField(
          style: TextStyle(
            // 👈 هذا لتكبير النص المُدخل
            fontSize: 55.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          textDirection: textDirection,
          decoration: InputDecoration(
            fillColor: Colors_App.lightWhiteColor,
            filled: true,
            hintText: isArabic ? hintText : 'Email',
            hintStyle:
                TextStyle(color: Colors_App.lightWhiteColor2, fontSize: 40.sp),
            prefixIcon: Icon(
              icon ?? Icons.person_2_outlined,
              size: 60.sp,
              color: Colors_App.lightWhiteColor2,
            ),
            suffixIcon: suffixIcon ?? null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide.none, // 👈 إزالة الخط الخارجي
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isArabic
                  ? 'الرجاء إدخال البريد الإلكتروني'
                  : 'Please enter your email';
            }
            return null;
          },
        ),
      ),
    );
  }
}
