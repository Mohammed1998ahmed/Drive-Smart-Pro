import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueLineChart extends StatelessWidget {
  final Map<String, double> data; // الشهر : الإيرادات

  const RevenueLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final months = data.keys.toList();
    final values = data.values.toList();

    return Container(
      height: 900.h,
      padding: EdgeInsets.all(40.sp),
      decoration: BoxDecoration(
        color: Colors_App.whiteColor,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors_App.blackColor.withOpacity(0.3),
            blurRadius: 10.r,
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'الإيرادات خلال آخر 6 أشهر',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizeBoxWidght(
              height: 30.h,
            ),
            Container(
              height: 800.h,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: _maxY(values) * 1.5,
                  minX: 0,
                  maxX: (values.length - 1).toDouble(),

                  // المحاور
                  titlesData: FlTitlesData(
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),

                    // محور Y يسار
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 200.w,
                        interval: _niceInterval(values),
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Text(
                              value.toInt().toString(),
                              style: TextStyle(fontSize: 45.sp),
                            ),
                          );
                        },
                      ),
                    ),

                    // محور X أسفل
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 120.h,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= months.length)
                            return const SizedBox.shrink();
                          return Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              months[index],
                              style: TextStyle(fontSize: 45.sp),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // خطوط الشبكة
                  // gridData: FlGridData(
                  //   show: true,
                  //   drawVerticalLine: false,
                  //   horizontalInterval: _niceInterval(values),
                  // ),

                  // بدون حدود
                  borderData: FlBorderData(show: false),

                  // البيانات
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 12.w,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.6),
                            Colors.blue.withOpacity(0.2),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      spots: List.generate(
                        values.length,
                        (i) => FlSpot(i.toDouble(), values[i]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _maxY(List<double> values) {
    double m = 0;
    for (final v in values) {
      if (v > m) m = v;
    }
    return m == 0 ? 10 : m;
  }

  double _niceInterval(List<double> values) {
    final max = _maxY(values);
    final raw = max / 5;

    if (raw <= 1) return 1;
    if (raw <= 5) return 5;
    if (raw <= 10) return 10;
    if (raw <= 50) return 50;
    if (raw <= 100) return 100;
    return (raw / 100).ceilToDouble() * 100;
  }
}
