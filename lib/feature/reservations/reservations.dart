import 'package:drivesmart/core/widgets/TextFromFieldWidght.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/colors.dart';
import 'ui/bookingsApp.dart';
import 'ui/cardTopWidght.dart';
import 'ui/topAppBarWidght.dart';
import 'ui/weeklyCalendar.dart';

// ignore: must_be_immutable
class ReservationsPage extends StatefulWidget {
  ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(50.sp),
            child: Column(children: [
              TopAppBarWidght(
                trailing: SizedBox(
                  width: ScreenUtil().screenWidth * 0.3,
                  height: 300.h,
                  child: TabBar(
                    labelStyle:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'تقويم',
                        icon: Icon(
                          Icons.calendar_month,
                          size: 50.sp,
                        ),
                        iconMargin: EdgeInsets.only(bottom: 20.h),
                      ),
                      Tab(
                        text: 'قائمة',
                        icon: Icon(Icons.list, size: 50.sp),
                        iconMargin: EdgeInsets.only(bottom: 20.h),
                      ),
                    ],
                  ),
                ),
              ),
              SizeBoxWidght(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardTopWidght(),
                  CardTopWidght(
                    nameText: 'الحجوزات المكتملة',
                    numberText: '4',
                    colorText: Colors_App.greyColor,
                    subString: '67% من الإجمالي',
                  ),
                  CardTopWidght(
                    nameText: 'قيد الانتظار',
                    numberText: '1',
                    colorText: Colors_App.redColor,
                    subString: 'تحتاج مراجعة',
                  ),
                  CardTopWidght(
                    nameText: 'الحجوزات الملغاة',
                    numberText: '2',
                    colorText: Colors_App.redColor,
                    subString: 'أخر 7 أيام',
                  ),
                ],
              ),
              SizeBoxWidght(height: 70.h),
              TextFromFieldWidght(),
              SizeBoxWidght(height: 70.h),
              Container(
                width: double.infinity,
                height: 1500.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      children: [
                        WeeklyCalendarSection(),
                      ],
                    ),
                    BookingsTable(),
                  ],
                ),
              )
            ])));
  }
}
