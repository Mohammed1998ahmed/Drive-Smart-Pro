import 'package:drivesmart/core/helper/serverBluc.dart';
import 'package:drivesmart/core/routers/app_router.dart';
import 'package:drivesmart/core/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(5177, 2540),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: Routers.home,
          onGenerateRoute: App_Roters.genrateRoute,
        );
      },

      // child: Directionality(
      //     textDirection: TextDirection.rtl, child: const LoginPage()),
    );
  }
}
