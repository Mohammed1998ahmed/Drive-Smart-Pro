import 'package:drivesmart/feature/course_Management/course_management.dart';
import 'package:drivesmart/feature/home/homePage.dart';
import 'package:drivesmart/feature/home/logic/cubit/home_cubit.dart';
import 'package:drivesmart/feature/user_Management/userManagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/login/login_page_widght.dart';
import '../../feature/reports_and_statistics/reportsAndStatistics.dart';
import '../../feature/reservations/reservations.dart';
import 'router.dart';

class App_Roters {
  static MaterialPageRoute genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.login:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl, child: LoginPage()));
      case Routers.home:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                textDirection: TextDirection.rtl,
                child: BlocProvider(
                  create: (context) => HomeCubit(),
                  child: HomePage(),
                )));
      case Routers.reportsAndStatisticsPage:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl,
                child: ReportsAndStatisticsPage()));
      case Routers.userManagementPage:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl, child: UserManagementPage()));
      case Routers.reservationsPage:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                textDirection: TextDirection.rtl, child: ReservationsPage()));
      case Routers.courseManagementPage:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl,
                child: CourseManagementPage()));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
