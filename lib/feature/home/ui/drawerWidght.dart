import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';
import 'drwerTopTextWidght.dart';

class DrawerWidght extends StatelessWidget {
  const DrawerWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * 0.2,
      height: ScreenUtil().screenHeight,
      decoration: BoxDecoration(
        color: Colors_App.whiteColor,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // لون الظل
            offset: const Offset(-5, 0), // 👈 من اليسار فقط (سالب X)
            blurRadius: 10, // درجة التمويه
            spreadRadius: 2, // مدى الانتشار
          ),
        ],
        borderRadius: BorderRadius.circular(15), // إن رغبت بحواف منحنية
      ),
      child: Column(
        children: [
          DrwerTopTextWidght(),
          SizeBoxWidght(
            height: 30.h,
          ),
          Divider(),
          SizeBoxWidght(
            height: 30.h,
          ),
          DrwerTopTextWidght(
            title: 'م.أحمد الشحادات',
            subtitle: 'مدير النظام',
            icon: Icons.person_2_outlined,
            radius: 360.r,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.home_max_outlined,
            nameButtom: ' لوحة التحكم ',
            numberItem: false,
            isTogelColorBackground: true,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.library_books,
            nameButtom: ' إدارة الدورات ',
            numberItem: false,
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.book_online,
            nameButtom: ' إدارة الحجوزات ',
            numberItem: true,
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.report_outlined,
            nameButtom: '   التقارير و الايرادات  ',
            numberItem: false,
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.cast_for_education,
            nameButtom: '  المحتوى التعليمي ',
            numberItem: false,
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.question_answer,
            nameButtom: ' بنك الاسئلة ',
            numberItem: false,
            isTogelColorBackground: false,
          ),
          ElevatedButtonWidght(
            onPressed: () {},
            iconData: Icons.settings,
            nameButtom: ' الإعدادات ',
            numberItem: false,
            isTogelColorBackground: false,
          ),
        ],
      ),
    );
  }
}

class ElevatedButtonWidght extends StatelessWidget {
  const ElevatedButtonWidght({
    super.key,
    required this.isTogelColorBackground,
    this.onPressed,
    this.nameButtom,
    this.iconData,
    this.numberItem,
  });
  final bool isTogelColorBackground;
  final Function()? onPressed;
  final String? nameButtom;
  final IconData? iconData;
  final bool? numberItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30.r), // ← غيّر القيمة كما تريد
              ),
            ),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
            ),
            backgroundColor: MaterialStatePropertyAll(
                isTogelColorBackground == true
                    ? Colors_App.primaryColor
                    : Colors_App.whiteColor)),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              iconData ?? Icons.person_2_outlined,
              color: isTogelColorBackground == true
                  ? Colors_App.whiteColor
                  : Colors_App.primaryColor,
            ),
            Text(
              nameButtom ?? ' إدراة المستخدمين ',
              style: TextStyle(
                  fontSize: 40.sp,
                  color: isTogelColorBackground == true
                      ? Colors_App.whiteColor
                      : Colors_App.blackColor),
            ),
            Spacer(),
            numberItem == false
                ? Container()
                : Container(
                    width: 150.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors_App.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.r)),
                    alignment: Alignment.center,
                    child: Text(
                      '145',
                      style: TextStyle(
                          color: Colors_App.primaryColor, fontSize: 40.sp),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
