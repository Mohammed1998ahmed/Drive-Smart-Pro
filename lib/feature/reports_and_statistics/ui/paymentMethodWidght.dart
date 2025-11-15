import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class PaymentMethodWidght extends StatelessWidget {
  const PaymentMethodWidght({
    super.key,
    required this.colorCircle,
    required this.methodName,
    required this.totalAmount,
    required this.numberWorks,
    required this.progressValue,
  });
  final Color colorCircle;
  final String methodName;
  final String totalAmount;
  final String numberWorks;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Row(
              children: [
                Text(methodName,
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors_App.blackColor)),
                Spacer(),
                Container(
                  width: 150.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors_App.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      numberWorks.toString(),
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors_App.greyColor),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  totalAmount,
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors_App.blackColor),
                ),
              ],
            ),
            SizeBoxWidght(
              height: 50.h,
            ),
            LinearProgressIndicator(
              value: progressValue,
              color: colorCircle,
              backgroundColor: Colors_App.greyColor.withOpacity(0.2),
              minHeight: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
