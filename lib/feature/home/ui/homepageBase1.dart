import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';
import 'ActiveOthers.dart';
import 'RevenueChart.dart';
import 'appBarDashBord.dart';
import 'drivingCoursesPieChart.dart';
import 'elevatedButtonWidght.dart';
import 'latestNotifications.dart';
import 'triningWidght.dart';

class homepageBase1 extends StatelessWidget {
  const homepageBase1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 50.h),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarDashBord(),
              SizeBoxWidght(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ElevatedButtonHomeWidght(),
                  ElevatedButtonHomeWidght(
                    colorIcon: Colors_App.greyColor,
                    colorTopSquer: Colors_App.greyColor.withOpacity(0.3),
                    numberItems: '36',
                    nameItmes: 'الدورات المتاحة',
                    icon: Icons.my_library_books_sharp,
                  ),
                  const ElevatedButtonHomeWidght(),
                  const ElevatedButtonHomeWidght(),
                ],
              ),
              SizeBoxWidght(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Row(
                  children: [
                    const Expanded(child: RevenueChart()),
                    SizeBoxWidght(
                      width: 60.w,
                    ),
                    const DrivingCoursesPieChart(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 50.h),
                child: Row(
                  children: [
                    const ActiveOthers(),
                    SizeBoxWidght(
                      width: 50.w,
                    ),
                    const LatestNotifications()
                  ],
                ),
              ),
              SizeBoxWidght(
                height: 20.h,
              ),
              Container(
                width: ScreenUtil().screenWidth * 0.758,
                height: 800.h,
                decoration: BoxDecoration(
                    color: Colors_App.whiteColor,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Padding(
                  padding: EdgeInsets.all(50.0.sp),
                  child: Column(
                    children: [
                      Text(
                        'أفضل المدربين',
                        style: TextStyle(
                            fontSize: 50.sp, fontWeight: FontWeight.bold),
                      ),
                      SizeBoxWidght(
                        height: 100.h,
                      ),
                      Row(
                        children: [
                          const TriningWidght(),
                          SizeBoxWidght(
                            width: 40.w,
                          ),
                          const TriningWidght(),
                          SizeBoxWidght(
                            width: 40.w,
                          ),
                          const TriningWidght()
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizeBoxWidght(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
