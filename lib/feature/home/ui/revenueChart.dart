import 'package:drivesmart/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600.w, // يمكنك تغييره حسب التصميم
      height: 1400.h,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'الإيرادات خلال آخر 6 أشهر',
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'تفاصيل',
                  style: TextStyle(
                      fontSize: 40.sp, color: Colors_App.primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          // 👇 هنا المخطط نفسه
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,

                maxY: 12000, // أعلى قيمة متوقعة في الإيرادات
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 150.sp, // المساحة المحجوزة على اليسار
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 40.sp, // 👈 غيّر هذا لتكبير أو تصغير النص
                            color: Colors.black87,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text(
                              'مايو',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          case 1:
                            return Text(
                              'يونيو',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          case 2:
                            return Text(
                              'يوليو',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          case 3:
                            return Text(
                              'أغسطس',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          case 4:
                            return Text(
                              'سبتمبر',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          case 5:
                            return Text(
                              'أكتوبر',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          default:
                            return Text(
                              '',
                              style: TextStyle(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: true),
                borderData: FlBorderData(show: false),
                barGroups: [
                  makeGroupData(0, 6000),
                  makeGroupData(1, 7500),
                  makeGroupData(2, 9000),
                  makeGroupData(3, 8000),
                  makeGroupData(4, 10000),
                  makeGroupData(5, 9500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 دالة مساعدة لإنشاء الأعمدة بسهولة
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.blueAccent,
          width: 25,
          borderRadius: BorderRadius.circular(6),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 12000,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
