import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/widgets/sizebox_widght.dart';

class ActiveOthers extends StatelessWidget {
  const ActiveOthers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 1000.h,
      decoration: BoxDecoration(
          color: Colors_App.whiteColor,
          borderRadius: BorderRadius.circular(30.r)),
      child: Column(
        children: [
          Text(
            'احصائيات سريعة',
            style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
          ),
          SizeBoxWidght(
            height: 50.h,
          ),
          // معدل الحضور
          _buildStatItem(
            label: "معدل الحضور",
            valueText: "94%",
            progress: 0.94,
          ),

          // معدل النجاح
          _buildStatItem(
            label: "معدل النجاح",
            valueText: "87%",
            progress: 0.87,
          ),

          // رضا العملاء
          _buildStatItem(
            label: "رضا العملاء",
            valueText: "4.6/5",
            progress: 0.92,
          ),

          // المدربين النشطين
          _buildStatItem(
            label: "المدربين النشطين",
            valueText: "12/15",
            progress: 0.8,
          ),
        ],
      ),
    ));
  }

  // 🔹 دالة لبناء كل سطر إحصائي
  Widget _buildStatItem({
    required String label,
    required String valueText,
    required double progress,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h, left: 100.w, right: 100.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                valueText,
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizeBoxWidght(
            height: 20.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.black87,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
