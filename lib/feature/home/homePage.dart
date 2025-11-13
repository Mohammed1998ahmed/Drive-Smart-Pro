import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:drivesmart/feature/home/ui/drivingCoursesPieChart.dart';
import 'package:drivesmart/feature/home/ui/elevatedButtonWidght.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/ActiveOthers.dart';
import 'ui/DrawerWidght.dart';
import 'ui/RevenueChart.dart';
import 'ui/appBarDashBord.dart';
import 'ui/latestNotifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.lightWhiteColor2,
      body: Row(
        children: [
          const DrawerWidght(),
          Expanded(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 45.w, vertical: 50.h),
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
                                TriningWidght(),
                                SizeBoxWidght(
                                  width: 40.w,
                                ),
                                TriningWidght(),
                                SizeBoxWidght(
                                  width: 40.w,
                                ),
                                TriningWidght()
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
          ))
        ],
      ),
    );
  }
}

class TriningWidght extends StatelessWidget {
  const TriningWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: ScreenUtil().screenWidth * 0.25,
        height: 400.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: Colors_App.primaryColor.withOpacity(0.3)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors_App.whiteColor,
                  // Colors_App.whiteColor,
                  Colors_App.primaryColor.withOpacity(0.03),
                  Colors_App.primaryColor.withOpacity(0.1)
                ])),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'أ: محمد الشحادات',
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 40.sp,
                  ),
                  SizeBoxWidght(
                    width: 20.w,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 30.sp),
                  )
                ],
              ),
              trailing: CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors_App.primaryColor.withOpacity(0.3),
              ),
            ),
            SizeBoxWidght(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  intentTrining(),
                  SizeBoxWidght(
                    width: 30.w,
                  ),
                  intentTrining(),
                ],
              ),
            ),
            SizeBoxWidght(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}

class intentTrining extends StatelessWidget {
  const intentTrining({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors_App.blackColor.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(-4, 3))
            ],
            color: Colors_App.whiteColor,
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '45',
              style: TextStyle(fontSize: 30.sp),
            ),
            Text(
              'طالب',
              style: TextStyle(fontSize: 30.sp),
            )
          ],
        ),
      ),
    );
  }
}
