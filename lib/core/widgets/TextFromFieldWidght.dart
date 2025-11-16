import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/colors.dart';
import 'sizebox_widght.dart';

class TextFromFieldWidght extends StatelessWidget {
  const TextFromFieldWidght({
    super.key,
    this.controller,
    this.hintText,
    this.TextButton,
    this.onPressed,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? TextButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * 0.765,
      height: 200.h,
      decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: ScreenUtil().screenWidth * 0.65,
              height: 120.h,
              alignment: Alignment.center,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 40.sp, // 👈 تكبير حجم النص المكتوب
                  color: Colors.black, // اختياري
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors_App.lightWhiteColor2.withOpacity(0.3),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 50.sp,
                    color: Colors_App.greyColor,
                  ),
                  hintText: hintText ?? 'ابحث عن مستخدم',

                  hintStyle: TextStyle(
                    fontSize: 40.sp,
                    color: Colors_App.greyColor,
                  ),
                  contentPadding:
                      EdgeInsets.zero, // لجعل النص والهنت في منتصف الحقل تماماً
                ),
              )),
          SizeBoxWidght(
            width: 20.w,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors_App.primaryColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.h),
                ),
              ),
              onPressed: onPressed,
              child: Container(
                width: 200.w,
                height: 100.h,
                child: Center(
                    child: Text(
                  TextButton ?? 'تصفيه',
                  style:
                      TextStyle(fontSize: 40.sp, color: Colors_App.whiteColor),
                )),
              )),
        ],
      ),
    );
  }
}
