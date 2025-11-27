import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/TextFromFieldWidght.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/cardPostWidght.dart';
import 'ui/tapBarWidght.dart';
import 'ui/topAppBarWidght.dart';

class EducationalContentPage extends StatefulWidget {
  const EducationalContentPage({super.key});

  @override
  State<EducationalContentPage> createState() => _EducationalContentPageState();
}

class _EducationalContentPageState extends State<EducationalContentPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          const TopAppBarWidght(),
          SizeBoxWidght(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CardPostWidght(),
              CardPostWidght(
                backgroundColorIcon: Colors_App.primaryColor.withOpacity(0.3),
                backgroundColorNumberPost: Colors_App.primaryColor,
                iconColor: Colors_App.primaryColor,
                iconData: Icons.bookmark,
                numberPost: "4",
                subtitle: " 3 منشورات",
                title: "المنشورات",
              ),
              CardPostWidght(
                backgroundColorIcon: Colors_App.greyColor.withOpacity(0.3),
                backgroundColorNumberPost: Colors_App.greyColor,
                iconColor: Colors_App.greyColor,
                iconData: Icons.image,
                numberPost: "4",
                subtitle: " 3 منشورات",
                title: "الصور",
              ),
              CardPostWidght(
                backgroundColorIcon: Colors_App.lightPinkColor.withOpacity(0.3),
                backgroundColorNumberPost: Colors_App.lightPinkColor,
                iconColor: Colors_App.lightPinkColor,
                iconData: Icons.download,
                numberPost: "4006",
                subtitle: " 3 منشورات",
                title: "التحميلات",
              ),
            ],
          ),
          SizeBoxWidght(
            height: 50.h,
          ),
          TextFromFieldWidght(),
          SizeBoxWidght(
            height: 50.h,
          ),
          MyTabBarInColumn()
        ],
      ),
    ));
  }
}
