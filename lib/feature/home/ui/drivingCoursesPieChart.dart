import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrivingCoursesPieChart extends StatelessWidget {
  const DrivingCoursesPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000.w,
      height: 1400.h,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'أنواع الدورات في مدرسة القيادة',
            style: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // 👇 هنا المخطط الدائري
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 30.sp, // المسافة بين القطع
                centerSpaceRadius: 30.r, // حجم الدائرة الوسطى (يمكنك جعله 0)
                borderData: FlBorderData(show: false),
                sections: _buildSections(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 الدورات ونسبها
  List<PieChartSectionData> _buildSections() {
    return [
      PieChartSectionData(
        color: Colors.blueAccent,
        value: 35, // النسبة المئوية
        title: 'يدوي\n35%',
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 30,
        title: 'أوتوماتيك\n30%',
        radius: 95,
        titleStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent,
        value: 20,
        title: 'نظري\n20%',
        radius: 90,
        titleStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 15,
        title: 'مكثف\n15%',
        radius: 85,
        titleStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}
