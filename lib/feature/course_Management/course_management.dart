import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/TextFromFieldWidght.dart';
import 'ui/listCardWidght.dart';
import 'ui/topBarWidght.dart';
import 'ui/topCardCoursesWidght.dart';

class CourseManagementPage extends StatelessWidget {
  const CourseManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TopBarWidght(),
          ListCardWidght(),
          SizeBoxWidght(
            height: 80.h,
          ),
          TextFromFieldWidght(),
          SizeBoxWidght(
            height: 60.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(90.0.sp),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 80.w,
                    mainAxisSpacing: 80.h,
                    childAspectRatio: 3.2000000000000000923077.sp,
                  ),
                  // shrinkWrap: true,
                  itemCount: 8,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => cardDetailsWidght(
                        onPressedDeseploy: () {},
                        onPressedDelete: () {},
                        onPressedEdit: () {},
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
