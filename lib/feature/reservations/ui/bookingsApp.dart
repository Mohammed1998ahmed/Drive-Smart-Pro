import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/core/widgets/sizebox_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// نموذج الحالة
enum BookingStatus {
  confirmed, // مؤكد
  pending, // قيد الانتظار
  rejected, // تم الرفض
  cancelled, // تم الإلغاء
}

// تحويل الحالة إلى نص عربي + ألوان
extension BookingStatusX on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.confirmed:
        return 'مؤكد';
      case BookingStatus.pending:
        return 'قيد الانتظار';
      case BookingStatus.rejected:
        return 'تم الرفض';
      case BookingStatus.cancelled:
        return 'تم الإلغاء';
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.confirmed:
        return Colors.green;
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.rejected:
        return Colors.red;
      case BookingStatus.cancelled:
        return Colors.grey;
    }
  }
}

// نموذج الحجز
class Booking {
  final int id;
  final String student;
  final String trainer;
  final String date; // يمكنك لاحقاً استخدام DateTime
  final String time;
  final String location;
  final BookingStatus status;

  Booking({
    required this.id,
    required this.student,
    required this.trainer,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
  });
}

// بيانات تجريبية مطابقة للصورة
final demoBookings = <Booking>[
  Booking(
    id: 1,
    student: 'أحمد محمد',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '09:00',
    location: 'غرفة التدريب',
    status: BookingStatus.confirmed,
  ),
  Booking(
    id: 2,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '10:00',
    location: 'غرفة التدريب',
    status: BookingStatus.confirmed,
  ),
  Booking(
    id: 3,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '11:00',
    location: 'غرفة التدريب',
    status: BookingStatus.confirmed,
  ),
  Booking(
    id: 4,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '13:00',
    location: 'غرفة التدريب',
    status: BookingStatus.pending,
  ),
  Booking(
    id: 5,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '14:00',
    location: 'غرفة التدريب',
    status: BookingStatus.rejected,
  ),
  Booking(
    id: 6,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '15:00',
    location: 'غرفة التدريب',
    status: BookingStatus.cancelled,
  ),
  Booking(
    id: 7,
    student: 'أحمد علي',
    trainer: 'أحمد السيد',
    date: 'الإثنين، ٢٣ يناير ٢٠٢٣',
    time: '16:00',
    location: 'غرفة A',
    status: BookingStatus.confirmed,
  ),
];

class BookingsTable extends StatelessWidget {
  const BookingsTable({super.key});

  DataColumn _col(String label) {
    return DataColumn(
      label: Text(label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.sp,
              color: Colors_App.whiteColor)),
    );
  }

  DataCell _statusCell(BookingStatus status) {
    return DataCell(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: status.color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: status.color.withOpacity(0.6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, color: status.color, size: 10),
            SizeBoxWidght(width: 8.w),
            Text(
              status.label,
              style: TextStyle(
                  color: status.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 40.sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // تمكين التمريرين الأفقي والعمودي
        return Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: DataTable(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  headingRowColor:
                      MaterialStateProperty.all(Colors_App.primaryColor),
                  dataRowColor:
                      MaterialStateProperty.all(Colors_App.whiteColor),
                  columns: [
                    _col('رقم الحجز'),
                    _col('الطالب'),
                    _col('المدرب'),
                    _col('التاريخ'),
                    _col('الوقت'),
                    _col('الموقع'),
                    _col('الحالة'),
                    _col('خيارات'),
                  ],
                  rows: demoBookings.map((b) {
                    return DataRow(
                      cells: [
                        DataCell(Text(
                          '#${b.id}',
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        DataCell(Text(
                          b.student,
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        DataCell(Text(
                          b.trainer,
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        DataCell(Text(
                          b.date,
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        DataCell(Text(
                          b.time,
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        DataCell(Text(
                          b.location,
                          style: TextStyle(fontSize: 40.sp),
                        )),
                        _statusCell(b.status),
                        DataCell(
                          TextButton.icon(
                            onPressed: () {
                              _showBooking(context, b);
                            },
                            icon: const Icon(Icons.visibility),
                            label: Text(
                              'عرض',
                              style: TextStyle(fontSize: 40.sp),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBooking(BuildContext context, Booking b) {
    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            'تفاصيل الحجز',
            style: TextStyle(fontSize: 40.sp),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _info('رقم الحجز', '#${b.id}'),
              _info('الطالب', b.student),
              _info('المدرب', b.trainer),
              _info('التاريخ', b.date),
              _info('الوقت', b.time),
              _info('الموقع', b.location),
              Row(
                children: [
                  Text('الحالة: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.sp)),
                  const SizedBox(width: 6),
                  Flexible(child: _statusChipInline(b.status)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إغلاق'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.sp)),
          Expanded(
              child: Text(
            value,
            style: TextStyle(fontSize: 40.sp),
          )),
        ],
      ),
    );
  }

  Widget _statusChipInline(BookingStatus status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: status.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: status.color.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, color: status.color, size: 10),
          SizeBoxWidght(width: 8.w),
          Text(
            status.label,
            style: TextStyle(
                color: status.color,
                fontWeight: FontWeight.w600,
                fontSize: 40.sp),
          ),
        ],
      ),
    );
  }
}
