import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class CardTopWidght extends StatelessWidget {
  const CardTopWidght({
    super.key,
    this.nameText,
    this.colorNumber,
    this.numberText,
    this.subText,
    this.nameButton,
  });
  final String? nameText;
  final Color? colorNumber;
  final String? numberText;
  final String? subText;
  final String? nameButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors_App.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      onPressed: () {},
      child: Container(
        width: ScreenUtil().screenWidth * 0.25,
        height: 400.h,
        decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors_App.blackColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    nameText ?? 'أجمالي الطلاب ',
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors_App.blackColor),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: colorNumber ?? Colors_App.primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Text(
                        numberText ?? '25',
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors_App.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizeBoxWidght(
                height: 40.h,
              ),
              Text(
                subText ?? '4 نشط',
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors_App.blackColor),
              ),
              SizeBoxWidght(
                height: 20.h,
              ),
              Text(
                nameButton ?? '1 مكتمل',
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors_App.blackColor.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
