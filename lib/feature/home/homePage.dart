import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/feature/course_Management/course_management.dart';
import 'package:drivesmart/feature/reservations/reservations.dart';
import 'package:drivesmart/feature/user_Management/userManagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../reports_and_statistics/reportsAndStatistics.dart';
import 'logic/cubit/home_cubit.dart';
import 'ui/DrawerWidght.dart';
import 'ui/homepageBase1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors_App.lightWhiteColor2,
          body: Row(
            children: [
              DrawerWidght(cubit: cubit),
              switch (HomeCubit.get(context).pages) {
                0 => const homepageBase1(),
                1 => const UserManagementPage(),
                2 => const CourseManagementPage(),
                3 => ReservationsPage(),
                4 => const ReportsAndStatisticsPage(),
                _ => const homepageBase1(),
              },
            ],
          ),
        );
      },
    );
  }
}
