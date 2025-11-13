import 'package:drivesmart/feature/home/homePage.dart';
import 'package:flutter/material.dart';

import '../../feature/login/login_page_widght.dart';
import 'router.dart';

class App_Roters {
  static MaterialPageRoute genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.login:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl, child: const LoginPage()));
      case Routers.home:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                textDirection: TextDirection.rtl, child: const HomePage()));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
