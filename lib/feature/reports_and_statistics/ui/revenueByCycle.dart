import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class RevenueByCycle extends StatelessWidget {
  const RevenueByCycle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1200.h,
        decoration: BoxDecoration(
            color: Colors_App.blueWhiteColor,
            borderRadius: BorderRadius.circular(50.r)),
        child: Padding(
          padding: EdgeInsets.all(40.sp),
          child: Column(
            children: [
              Text(
                "الايرادات حسب الدورة",
                style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors_App.blackColor),
              ),
              SizeBoxWidght(
                height: 40.h,
              ),
              TypesOfCoursesWIdght(),
              SizeBoxWidght(
                height: 40.h,
              ),
              TypesOfCoursesWIdght(
                progressValue: 0.3,
                cost: 'M 300',
                dropdownValue: 'الدورة الابتدائية ',
                percentage: '% 30',
              ),
              SizeBoxWidght(
                height: 40.h,
              ),
              TypesOfCoursesWIdght(
                progressValue: 0.15,
                cost: 'M 560',
                dropdownValue: 'الدورة القيادة الثقيلة ',
                percentage: '% 15',
              ),
              SizeBoxWidght(
                height: 40.h,
              ),
              TypesOfCoursesWIdght(
                progressValue: 0.10,
                cost: 'M 160',
                dropdownValue: 'أخرى',
                percentage: '% 10',
              ),
              SizeBoxWidght(
                height: 60.h,
              ),
              Container(
                width: ScreenUtil().screenWidth * 0.35,
                height: 160.h,
                decoration: BoxDecoration(
                    color: Colors_App.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    Text(
                      'الإجمالي  الإيرادات  ',
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors_App.blackColor),
                    ),
                    Spacer(),
                    Text(
                      'M 125',
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors_App.blackColor),
                    ),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TypesOfCoursesWIdght extends StatelessWidget {
  const TypesOfCoursesWIdght({
    super.key,
    this.dropdownValue,
    this.cost,
    this.percentage,
    this.progressValue,
  });
  final String? dropdownValue;
  final String? cost;
  final String? percentage;
  final double? progressValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(dropdownValue ?? 'القيادة الاساسية',
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold)),
              Spacer(),
              Text(cost ?? 'M 230 ',
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold)),
              SizeBoxWidght(width: 40.w),
              Container(
                width: 150.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: Colors_App.primaryColor.withOpacity(0.2)),
                child: Center(
                  child: Text(
                    percentage ?? '% 45',
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors_App.primaryColor),
                  ),
                ),
              )
            ],
          ),
          SizeBoxWidght(
            height: 20.h,
          ),
          LinearProgressIndicator(
            value: progressValue ?? 0.7,
            color: Colors_App.primaryColor,
            minHeight: 40.h,
            borderRadius: BorderRadius.circular(25.r),
            backgroundColor: Colors_App.primaryColor.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
