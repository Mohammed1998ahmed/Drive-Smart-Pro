import 'package:flutter/material.dart';

import '../../feature/login/login_page_widght.dart';
import 'router.dart';

class App_Roters {
  MaterialPageRoute genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
