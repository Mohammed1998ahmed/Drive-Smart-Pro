import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentsTable extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {
      "name": "أحمد محمد علي",
      "phone": "456 123 0932",
      "email": "ahmed@example.com",
      "course": "القيادة الأساسية",
      "progress": 75,
      "status": "نشط",
      "date": "2025/01/15",
    },
    {
      "name": "فاطمة أحمد حسن",
      "phone": "789 456 0933",
      "email": "fatima@example.com",
      "course": "القيادة المتقدمة",
      "progress": 60,
      "status": "نشط",
      "date": "2025/01/10",
    },
    {
      "name": "محمد خالد سليم",
      "phone": "012 789 0934",
      "email": "mohammad@example.com",
      "course": "التوقيف والركن",
      "progress": 45,
      "status": "نشط",
      "date": "2025/01/05",
    },
    {
      "name": "سارة علي محمود",
      "phone": "567 234 0935",
      "email": "sara@example.com",
      "course": "القيادة الأساسية",
      "progress": 90,
      "status": "نشط",
      "date": "2025/01/20",
    },
    {
      "name": "عمر حسن أحمد",
      "phone": "678 345 0936",
      "email": "omar@example.com",
      "course": "القيادة المتقدمة",
      "progress": 100,
      "status": "مكتمل",
      "date": "2024/12/01",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              spreadRadius: 1,
            )
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: ScreenUtil().screenWidth * 0.04,
            headingRowHeight: ScreenUtil().screenHeight * 0.04,
            dataRowHeight: 185.h,
            headingTextStyle: TextStyle(
              fontSize: 45.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            dataTextStyle: TextStyle(
              fontSize: 40.sp,
            ),
            columns: const [
              DataColumn(label: Text("الاسم")),
              DataColumn(label: Text("الهاتف")),
              DataColumn(label: Text("البريد الإلكتروني")),
              DataColumn(label: Text("الدورة")),
              DataColumn(label: Text("التقدم")),
              DataColumn(label: Text("الحالة")),
              DataColumn(label: Text("تاريخ الانضمام")),
              DataColumn(label: Text("إجراءات")),
            ],
            rows: students.map((student) {
              return DataRow(
                cells: [
                  DataCell(Text(student["name"])),
                  DataCell(Row(
                    children: [
                      Icon(Icons.phone, size: 30.sp, color: Colors.blue),
                      SizedBox(width: 10.w),
                      Text(student["phone"]),
                    ],
                  )),
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: student["email"]));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("تم النسخ: ${student["email"]}")),
                        );
                      },
                      child: Text(student["email"]),
                    ),
                  ),

                  // DataCell(Row(
                  //   children: [
                  //     Text(student["email"]),
                  //     SizedBox(width: 10.w),
                  //     Icon(Icons.email, size: 30.sp, color: Colors.grey),
                  //   ],
                  // )),
                  DataCell(Text(student["course"])),
                  DataCell(Row(
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: LinearProgressIndicator(
                          value: student["progress"] / 100,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text("${student["progress"]}%"),
                    ],
                  )),
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: student["status"] == "نشط"
                            ? Colors.green.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        student["status"],
                        style: TextStyle(
                          color: student["status"] == "نشط"
                              ? Colors.green
                              : Colors.black54,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),
                  DataCell(Text(student["date"])),
                  DataCell(Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red, size: 40.sp),
                      SizedBox(width: 20.w),
                      Icon(Icons.edit, color: Colors.blue, size: 40.sp),
                      SizedBox(width: 20.w),
                      Icon(Icons.visibility, color: Colors.grey, size: 40.sp),
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
