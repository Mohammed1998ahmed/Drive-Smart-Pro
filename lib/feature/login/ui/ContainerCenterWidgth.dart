import 'package:drivesmart/core/helper/extenations.dart';
import 'package:drivesmart/core/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';
import 'TopTextWidght.dart';
import 'textFromFeildWidght.dart';
import 'textnamefeildwidght.dart';

class ContainerCenterWidgth extends StatelessWidget {
  const ContainerCenterWidgth(
      {super.key,
      required this.valueCheckBox,
      required this.textDirection,
      required this.isArabic});
  final bool valueCheckBox;
  final TextDirection textDirection;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1254.w,
      height: 1508.h,
      margin: EdgeInsets.all(60.sp),
      decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          borderRadius: BorderRadius.circular(32.r)),
      child: Column(
        children: [
          const TopTextWidght(),
          SizeBoxWidght(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              width: 1254.w,
              height: 650.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textNameFeildWidght(
                    name: 'اسم الحساب',
                  ),
                  textFromFeildWidght(
                    textDirection: textDirection,
                    isArabic: isArabic,
                    hintText: 'ادخل اسم الحساب',
                  ),
                  SizeBoxWidght(
                    height: 30.h,
                  ),
                  textNameFeildWidght(
                    name: 'كلمة المرور',
                  ),
                  textFromFeildWidght(
                    textDirection: textDirection,
                    isArabic: isArabic,
                    hintText: 'ادخال كلمة المرور',
                    icon: Icons.lock_outline,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors_App.lightWhiteColor2,
                      size: 70.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: valueCheckBox,
                    onChanged: (togel) {},
                  ),
                  Text(
                    "تذكيري",
                    style: TextStyle(fontSize: 40.sp),
                  )
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'نسيت كلمه المرور؟',
                  style: TextStyle(fontSize: 40.sp),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.r), // ← غيّر القيمة كما تريد
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 440.w),
                ),
                backgroundColor:
                    MaterialStatePropertyAll(Colors_App.primaryColor)),
            onPressed: () {
              context.pushNamed(Routers.home);
            },
            child: Text(
              'تسجيل دخول',
              style: TextStyle(fontSize: 40.sp, color: Colors_App.whiteColor),
            ),
          ),
          SizeBoxWidght(
            height: 30.h,
          ),
          Container(
            width: 1600.w,
            height: 150.h,
            alignment: Alignment.center,
            margin: EdgeInsets.all(60.sp),
            decoration: BoxDecoration(color: Colors_App.blueWhiteColor),
            child: Text(
              '🔒 نظام محمي بتشفير على المستوى',
              style: TextStyle(fontSize: 40.sp),
            ),
          )
        ],
      ),
    );
  }
}
