import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class TopAppBarWidght extends StatelessWidget {
  const TopAppBarWidght({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'إدارة المحتوى التعليمي',
        style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'إدارة الفيديوهات والملفات والصور التعليمية',
        style: TextStyle(
          fontSize: 40.sp,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        child: Container(
          width: 450.w,
          height: 120.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors_App.primaryColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload,
                color: Colors_App.whiteColor,
                size: 40.sp,
              ),
              SizeBoxWidght(
                width: 20.w,
              ),
              Text(
                'أرفع ملفات جديدة',
                style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors_App.whiteColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
