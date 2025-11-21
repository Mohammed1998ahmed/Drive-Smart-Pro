import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class TopBarWidght extends StatelessWidget {
  const TopBarWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'إدارة الدورات',
        style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'هنا يمكنك إدارة الدورات المتاحة للمستخدمين.',
        style: TextStyle(fontSize: 40.sp),
      ),
      trailing: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors_App.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          width: 450.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors_App.primaryColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors_App.whiteColor,
                  size: 35.sp,
                ),
                SizeBoxWidght(
                  width: 20.w,
                ),
                Text(
                  'إضافة دورة جديدة',
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: Colors_App.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      // إضافة المزيد من عناصر واجهة المستخدم لإدارة الدورات هنا
    );
  }
}
