import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class TriningWidght extends StatelessWidget {
  const TriningWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: ScreenUtil().screenWidth * 0.25,
        height: 400.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: Colors_App.primaryColor.withOpacity(0.3)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors_App.whiteColor,
                  // Colors_App.whiteColor,
                  Colors_App.primaryColor.withOpacity(0.03),
                  Colors_App.primaryColor.withOpacity(0.1)
                ])),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'أ: محمد الشحادات',
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 40.sp,
                  ),
                  SizeBoxWidght(
                    width: 20.w,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 30.sp),
                  )
                ],
              ),
              trailing: CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors_App.primaryColor.withOpacity(0.3),
              ),
            ),
            SizeBoxWidght(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  intentTrining(),
                  SizeBoxWidght(
                    width: 30.w,
                  ),
                  intentTrining(),
                ],
              ),
            ),
            SizeBoxWidght(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}

class intentTrining extends StatelessWidget {
  const intentTrining({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors_App.blackColor.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(-4, 3))
            ],
            color: Colors_App.whiteColor,
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '45',
              style: TextStyle(fontSize: 30.sp),
            ),
            Text(
              'طالب',
              style: TextStyle(fontSize: 30.sp),
            )
          ],
        ),
      ),
    );
  }
}
