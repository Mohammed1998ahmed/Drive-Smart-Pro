import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/themes/colors.dart';
import '../../core/widgets/TextFromFieldWidght.dart';
import 'ui/cardTopWidght.dart';
import 'ui/employeesTable.dart';
import 'ui/studentsTable.dart';
import 'ui/topAppBarWidght.dart';
import 'ui/trainersTable.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(50.0.sp),
        child: Column(
          children: [
            TopAppBarWidght(),
            SizeBoxWidght(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.all(30.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CardTopWidght(),
                  SizeBoxWidght(
                    width: 20.w,
                  ),
                  const CardTopWidght(
                    nameText: 'أجمالي المدربين ',
                    colorNumber: Colors_App.greyColor,
                    numberText: '10',
                    subText: '6 نشط',
                  ),
                  SizeBoxWidght(
                    width: 20.w,
                  ),
                  const CardTopWidght(
                    nameText: 'أجمالي الموظفين ',
                    colorNumber: Colors_App.lightPinkColor,
                    numberText: '8',
                    subText: '5 نشط',
                  ),
                ],
              ),
            ),
            SizeBoxWidght(
              height: 50.h,
            ),
            const TextFromFieldWidght(),
            SizeBoxWidght(
              height: 50.h,
            ),
            Container(
              width: ScreenUtil().screenWidth * 0.8,
              height: ScreenUtil().screenHeight * 0.5,
              decoration: BoxDecoration(
                color: Colors_App.whiteColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    // ---- TAB BAR ---- //
                    Container(
                      width: ScreenUtil().screenWidth * 0.2,
                      height: 120.h,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors_App.lightWhiteColor2,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                        tabs: [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Text(
                                'الطلاب',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: Colors_App.blackColor,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Text(
                                'المدربين',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: Colors_App.blackColor,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Text(
                                'الموظفيين',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: Colors_App.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // ---- TAB BAR VIEW ---- //
                    Expanded(
                      child: TabBarView(
                        children: [
                          StudentsTable(),
                          TrainersTable(),
                          EmployeesTable(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
