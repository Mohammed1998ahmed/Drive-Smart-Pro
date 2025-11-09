import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class textNameFeildWidght extends StatelessWidget {
  const textNameFeildWidght({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          color: Colors_App.blackColor.withOpacity(0.8),
          fontSize: 40.sp,
          fontWeight: FontWeight.bold),
    );
  }
}
