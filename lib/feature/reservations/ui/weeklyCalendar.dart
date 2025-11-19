import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeeklyCalendarSection extends StatefulWidget {
  const WeeklyCalendarSection({super.key});

  @override
  State<WeeklyCalendarSection> createState() => _WeeklyCalendarSectionState();
}

class _WeeklyCalendarSectionState extends State<WeeklyCalendarSection> {
  DateTime _startOfWeek = _getStartOfWeek(DateTime.now());

  static DateTime _getStartOfWeek(DateTime date) {
    int diff = date.weekday % 7; // السبت = 0
    return date.subtract(Duration(days: diff));
  }

  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(const Duration(days: 7));
    });
  }

  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
    });
  }

  final Map<DateTime, Map<String, int>> taskDataByDate = {
    DateTime(2025, 11, 15): {
      'تم الإنجاز': 5,
      'قيد التنفيذ': 2,
      'تم sالإنجاز': 5,
      'قيد sالتنفيذ': 2,
      'تم sاdلإنجاز': 5,
      'قيد sالdتنفيذ': 2,
      'تم sاsdلإنجاز': 5,
      'قيد sالsتنفيذ': 2,
      'تم sالaإنجاز': 5,
      'قيد sالaتنفيذ': 2
    }, // السبت
    DateTime(2025, 11, 16): {
      'تم الإنجاز': 4,
      'قيد التنفيذ': 2,
      'تم الإنجاsز': 5,
      'قيد اsلتنفيذ': 2
    }, // الأحد
    DateTime(2025, 11, 17): {'لم تبدأ بعد': 3}, // الإثنين
    DateTime(2025, 11, 18): {'قيد التنفيذ': 4}, // الثلاثاء
    DateTime(2025, 11, 19): {'تم الإنجاز': 2}, // الأربعاء
    DateTime(2025, 11, 20): {'تم الإنجاز': 2, 'قيد التنفيذ': 1}, // الخميس
    DateTime(2025, 11, 21): {'تم الإنجاز': 1}, // الجمعة
  };

  final Map<String, Color> statusColors = {
    'تم الإنجاز': Colors.green,
    'قيد التنفيذ': Colors.orange,
    'لم تبدأ بعد': Colors.red,
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ar', null); // تهيئة اللغة العربية
  }

  @override
  Widget build(BuildContext context) {
    // التاريخ الكامل: الأربعاء، 19 نوفمبر 2025
    final dateFormat = DateFormat('EEEE، d MMMM yyyy', 'ar');

    return Column(
      children: [
        // العنوان + أزرار التنقل
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'نظرة عامة على المهام الأسبوعية',
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _previousWeek),
                IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _nextWeek),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        // عرض الأيام
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(7, (index) {
            final date = _startOfWeek.add(Duration(days: index));
            final formattedDate = dateFormat.format(date);
            final tasks =
                taskDataByDate[DateTime(date.year, date.month, date.day)] ?? {};

            return Expanded(
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40.sp)),
                      const Divider(),
                      ...tasks.entries.map((entry) {
                        final status = entry.key;
                        final count = entry.value;
                        final color = statusColors[status] ?? Colors.grey;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            border: Border.all(color: color),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.task, color: color, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text('$status: $count',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 35.sp)),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
