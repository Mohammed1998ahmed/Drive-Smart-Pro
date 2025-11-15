import 'package:drivesmart/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyFinanceBarChart extends StatelessWidget {
  // بيانات مثال: لكل شهر (اسم الشهر) قيم: 'profits' الربح، 'expenses' المصروف، 'revenue' الإيراد
  final Map<String, Map<String, double>> data;

  MonthlyFinanceBarChart({Key? key, required this.data}) : super(key: key);

  // ألوان الأعمدة
  final Color profitColor = Colors.green;
  final Color expenseColor = Colors.red;
  final Color revenueColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final months = data.keys.toList();
    // تحويل البيانات إلى BarChartGroupData
    final groups = <BarChartGroupData>[];
    for (int i = 0; i < months.length; i++) {
      final m = months[i];
      final values = data[m]!;
      final profit = values['profits'] ?? 0;
      final expense = values['expenses'] ?? 0;
      final revenue = values['revenue'] ?? 0;

      groups.add(
        BarChartGroupData(
          x: i,
          barsSpace: 10.w,
          barRods: [
            BarChartRodData(
                toY: profit,
                width: 150.w,
                color: profitColor,
                borderRadius: BorderRadius.circular(10.r)),
            BarChartRodData(
                toY: expense,
                width: 150.w,
                color: expenseColor,
                borderRadius: BorderRadius.circular(10.r)),
            BarChartRodData(
                toY: revenue,
                width: 150.w,
                color: revenueColor,
                borderRadius: BorderRadius.circular(10.r)),
          ],
          // مكان المحور العمودي داخل المجموعة لجعل الأعمدة متجمعة
          showingTooltipIndicators: [0, 1, 2],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors_App.whiteColor,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
              color: Colors_App.blackColor.withOpacity(0.5), blurRadius: 6)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'مخطط شهري - الأرباح / المصروفات / الإيرادات',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 1000.h,
            child: BarChart(
              BarChartData(
                maxY: _calculateMaxY(data) * 1.15, // بعض المساحة العلوية
                barGroups: groups,
                groupsSpace: 300.w,
                alignment: BarChartAlignment.start,
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 350.w,
                      interval: _niceInterval(data),
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(),
                            style: TextStyle(fontSize: 50.sp));
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 42,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final i = value.toInt();
                        if (i < 0 || i >= months.length)
                          return const SizedBox.shrink();
                        // إظهار اسم الشهر (موجز)
                        final label = months[i];
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(label, style: TextStyle(fontSize: 50.sp)),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                    show: true, horizontalInterval: _niceInterval(data)),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.grey.shade200,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final month = months[group.x.toInt()];
                      String label;
                      if (rodIndex == 0)
                        label = 'ربح';
                      else if (rodIndex == 1)
                        label = 'مصروف';
                      else
                        label = 'إيراد';
                      return BarTooltipItem(
                        '$month\n$label: ${rod.toY.toStringAsFixed(2)}',
                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // وسيلة شرح الألوان
          Row(
            children: [
              _legendDot(profitColor, 'الأرباح'),
              const SizedBox(width: 12),
              _legendDot(expenseColor, 'المصروفات'),
              const SizedBox(width: 12),
              _legendDot(revenueColor, 'الإيرادات'),
            ],
          ),
        ],
      ),
    );
  }

  // مولد عنصر وسيلة الشرح
  Widget _legendDot(Color color, String text) {
    return Row(
      children: [
        Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color,
            )),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(fontSize: 50.sp)),
      ],
    );
  }

  // حساب قيمة عظمى مناسبة للمحور من البيانات
  double _calculateMaxY(Map<String, Map<String, double>> data) {
    double maxVal = 0;
    for (final m in data.values) {
      for (final v in m.values) {
        if (v > maxVal) maxVal = v;
      }
    }
    if (maxVal == 0) return 10;
    return maxVal;
  }

  // اختيار فاصل مناسب لخطوط الشبكة
  double _niceInterval(Map<String, Map<String, double>> data) {
    final maxY = _calculateMaxY(data);
    // نريد حوالي 4-6 خطوط شبكية
    final raw = maxY / 5;
    if (raw <= 1) return 1;
    if (raw <= 5) return 5;
    if (raw <= 10) return 10;
    if (raw <= 50) return 50;
    if (raw <= 100) return 100;
    // تقريب للقيمة الأعلى
    return (raw / 100).ceilToDouble() * 100;
  }
}
