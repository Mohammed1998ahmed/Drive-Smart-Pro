import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:drivesmart/feature/reports_and_statistics/ui/elevatedButtonWidght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/monthlyFinanceBarChart.dart';
import 'ui/paymentMethodWidght.dart';
import 'ui/revenueByCycle.dart';
import 'ui/revenueLineChart.dart';
import 'ui/studentsLineChart.dart';
import 'ui/topBarWidght.dart';

class ReportsAndStatisticsPage extends StatelessWidget {
  const ReportsAndStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBarWidght(),
              Padding(
                padding: EdgeInsets.all(50.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButtonReportWidght(
                      ColorTextNumber: Colors_App.whiteColor,
                      gradient: LinearGradient(
                          // tileMode: TileMode.clamp,
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors_App.primaryColor.withOpacity(0.4),
                            Colors_App.primaryColor.withOpacity(0.7),
                            Colors_App.primaryColor
                          ]),
                    ),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    ElevatedButtonReportWidght(
                      ColorTextNumber: Colors_App.whiteColor,
                      gradient: LinearGradient(
                          // tileMode: TileMode.clamp,
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors_App.greyColor.withOpacity(0.4),
                            Colors_App.greyColor.withOpacity(0.7),
                            Colors_App.greyColor
                          ]),
                    ),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    ElevatedButtonReportWidght(
                      ColorTextNumber: Colors_App.whiteColor,
                      gradient: LinearGradient(
                          // tileMode: TileMode.clamp,
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors_App.lightredColor.withOpacity(0.4),
                            Colors_App.lightredColor.withOpacity(0.7),
                            Colors_App.lightredColor
                          ]),
                    ),
                    SizeBoxWidght(
                      width: 20.w,
                    ),
                    ElevatedButtonReportWidght(
                      ColorTextNumber: Colors_App.whiteColor,
                      gradient: LinearGradient(
                          // tileMode: TileMode.clamp,
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors_App.lightPinkColor.withOpacity(0.4),
                            Colors_App.lightPinkColor.withOpacity(0.7),
                            Colors_App.lightPinkColor
                          ]),
                    ),
                  ],
                ),
              ),
              SizeBoxWidght(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.w),
                child: MonthlyFinanceBarChart(
                  data: const {
                    'يناير': {
                      'profits': 1200,
                      'expenses': 800,
                      'revenue': 2000
                    },
                    'فبرير': {
                      'profits': 1500,
                      'expenses': 700,
                      'revenue': 2200
                    },
                    'مارس': {'profits': 1000, 'expenses': 900, 'revenue': 1900},
                    'أبريل': {
                      'profits': 1800,
                      'expenses': 1100,
                      'revenue': 2900
                    },
                    'مايو': {'profits': 900, 'expenses': 600, 'revenue': 1500},
                    'يونيو': {
                      'profits': 2000,
                      'expenses': 1200,
                      'revenue': 3200
                    },
                  },
                ),
              ),
              SizeBoxWidght(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                      height: 1000.h,
                      child: const RevenueLineChart(
                        data: {
                          "يناير": 1200,
                          "فبراير": 1600,
                          "مارس": 1900,
                          "أبريل": 2500,
                          "مايو": 3000,
                          "يونيو": 4200,
                        },
                      ),
                    )),
                    SizeBoxWidght(
                      width: 50.w,
                    ),
                    Expanded(
                        child: Container(
                      height: 1000.h,
                      child: const StudentsLineChart(
                        data: {
                          "يناير": 400,
                          "فبراير": 180,
                          "مارس": 320,
                          "أبريل": 160,
                          "مايو": 310,
                          "يونيو": 470,
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(90.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RevenueByCycle(),
                    SizeBoxWidght(
                      width: 50.w,
                    ),
                    Expanded(
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
                                'طرق الدفع',
                                style: TextStyle(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors_App.blackColor),
                              ),
                              SizeBoxWidght(
                                height: 40.h,
                              ),
                              Container(
                                width: ScreenUtil().screenWidth * 0.37,
                                height: 280.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color:
                                        Colors_App.greyColor.withOpacity(0.1)),
                                child: const Column(
                                  children: [
                                    PaymentMethodWidght(
                                      colorCircle: Colors_App.greyColor,
                                      methodName: 'محفظة إلكترونية',
                                      numberWorks: '120 عملية',
                                      totalAmount: 'M 4,500',
                                      progressValue: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              SizeBoxWidght(
                                height: 40.h,
                              ),
                              Container(
                                width: ScreenUtil().screenWidth * 0.37,
                                height: 280.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color:
                                        Colors_App.greyColor.withOpacity(0.1)),
                                child: const Column(
                                  children: [
                                    PaymentMethodWidght(
                                      colorCircle: Colors_App.greyColor,
                                      methodName: 'بطاقة ائتمانية',
                                      numberWorks: '100 عملية',
                                      totalAmount: 'M 20,000',
                                      progressValue: 0.2,
                                    ),
                                  ],
                                ),
                              ),
                              SizeBoxWidght(
                                height: 40.h,
                              ),
                              Container(
                                width: ScreenUtil().screenWidth * 0.37,
                                height: 280.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color:
                                        Colors_App.greyColor.withOpacity(0.1)),
                                child: const Column(
                                  children: [
                                    PaymentMethodWidght(
                                      colorCircle: Colors_App.greyColor,
                                      methodName: 'تحويل بنكي',
                                      numberWorks: '120 عملية',
                                      totalAmount: 'M 6,000',
                                      progressValue: 0.3,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
