import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class ElevatedButtonReportWidght extends StatelessWidget {
  const ElevatedButtonReportWidght({
    super.key,
    this.icon,
    this.colorIcon,
    this.colorTopSquer,
    this.numberItems,
    this.nameItmes,
    this.gradient,
    this.ColorTextNumber,
  });
  final IconData? icon;
  final Color? colorIcon;
  final Color? colorTopSquer;
  final String? numberItems;
  final String? nameItmes;
  final Gradient? gradient;
  final Color? ColorTextNumber;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.r), // 👈 مقدار انثناء الحواف
            ),
          ),
          // backgroundColor:
          //     const MaterialStatePropertyAll(Colors_App.whiteColor),
          //// لون الزر

          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          ),
        ),
        onPressed: () {},
        child: Container(
          width: 910.w,
          height: 510.h,
          decoration: BoxDecoration(
              gradient: gradient, borderRadius: BorderRadius.circular(50.r)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: colorTopSquer ??
                              Colors_App.whiteColor.withOpacity(0.4)),
                      child: Icon(
                        icon ?? Icons.person_outline,
                        color: colorIcon ?? Colors_App.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 150.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors_App.whiteColor.withOpacity(0.2)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Colors_App.whiteColor,
                              size: 35.sp,
                            ),
                            const Spacer(),
                            Text(
                              '12%',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color:
                                      ColorTextNumber ?? Colors_App.greyColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  numberItems ?? '196',
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: ColorTextNumber ?? Colors_App.greyColor,
                  ),
                ),
                Text(
                  nameItmes ?? 'إجمالي الطلاب',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorTextNumber ?? Colors_App.greyColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
