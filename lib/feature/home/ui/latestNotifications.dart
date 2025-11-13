import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class LatestNotifications extends StatelessWidget {
  const LatestNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1000.h,
        decoration: BoxDecoration(
            color: Colors_App.whiteColor,
            borderRadius: BorderRadius.circular(30.r)),
        child: Padding(
          padding: EdgeInsets.all(50.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'النشاطات الأخيرة',
                    style:
                        TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل ',
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizeBoxWidght(
                height: 40.h,
              ),
              Container(
                width: ScreenUtil().screenWidth * 0.7,
                height: 700.h,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizeBoxWidght(
                    height: 20.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors_App.lightWhiteColor2.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: ListTile(
                        title: Text(
                          'حجز جديد من احمد ',
                          style: TextStyle(
                              fontSize: 45.sp, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'منذ 5 دقايق ',
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors_App.primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
