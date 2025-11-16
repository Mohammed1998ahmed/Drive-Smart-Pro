import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainersTable extends StatelessWidget {
  final List<Map<String, dynamic>> trainers = [
    {
      "name": "أ. أحمد السيد",
      "phone": "222 111 0932",
      "email": "ahmed.inst@example.com",
      "spec": "قيادة أساسية",
      "students": 45,
      "rating": 4.9,
      "status": "نشط",
    },
    {
      "name": "أ. محمد علي",
      "phone": "333 222 0933",
      "email": "mohammad.inst@example.com",
      "spec": "قيادة متقدمة",
      "students": 38,
      "rating": 4.7,
      "status": "نشط",
    },
    {
      "name": "أ. خالد حسن",
      "phone": "444 333 0934",
      "email": "khaled.inst@example.com",
      "spec": "ركن وتوقيف",
      "students": 32,
      "rating": 4.8,
      "status": "نشط",
    },
    {
      "name": "أ. فادي يوسف",
      "phone": "555 444 0935",
      "email": "fadi.inst@example.com",
      "spec": "قيادة أساسية",
      "students": 28,
      "rating": 4.6,
      "status": "غير نشط",
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
              DataColumn(label: Text("التخصص")),
              DataColumn(label: Text("الطلاب")),
              DataColumn(label: Text("التقييم")),
              DataColumn(label: Text("الحالة")),
              DataColumn(label: Text("إجراءات")),
            ],
            rows: trainers.map((trainer) {
              return DataRow(
                cells: [
                  // الاسم + صورة دائرية
                  DataCell(Row(
                    children: [
                      CircleAvatar(
                        radius: 28.r,
                        backgroundColor: Colors.green.withOpacity(0.2),
                      ),
                      SizedBox(width: 10.w),
                      Text(trainer["name"]),
                    ],
                  )),

                  // الهاتف مع أيقونة
                  DataCell(
                    Row(
                      children: [
                        Icon(Icons.phone, size: 28.sp, color: Colors.blue),
                        SizedBox(width: 8.w),
                        Text(trainer["phone"]),
                      ],
                    ),
                  ),

                  // البريد + أيقونة + زر نسخ
                  DataCell(
                    Row(
                      children: [
                        Text(trainer["email"]),
                        SizedBox(width: 10.w),
                        Icon(Icons.email, size: 30.sp, color: Colors.grey),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: trainer["email"]));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("تم نسخ البريد الإلكتروني")),
                            );
                          },
                          child:
                              Icon(Icons.copy, size: 28.sp, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  // التخصص
                  DataCell(Text(trainer["spec"])),

                  // عدد الطلاب
                  DataCell(
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "${trainer["students"]} طالب",
                        style: TextStyle(color: Colors.blue, fontSize: 30.sp),
                      ),
                    ),
                  ),

                  // التقييم
                  DataCell(
                    Row(
                      children: [
                        Text("${trainer["rating"]}"),
                        SizedBox(width: 5.w),
                        Icon(Icons.star, color: Colors.orange, size: 32.sp),
                      ],
                    ),
                  ),

                  // الحالة
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: trainer["status"] == "نشط"
                            ? Colors.green.withOpacity(0.2)
                            : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        trainer["status"],
                        style: TextStyle(
                          color: trainer["status"] == "نشط"
                              ? Colors.green
                              : Colors.red,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),

                  // الإجراءات
                  DataCell(
                    Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red, size: 40.sp),
                        SizedBox(width: 15.w),
                        Icon(Icons.edit, color: Colors.blue, size: 40.sp),
                        SizedBox(width: 15.w),
                        Icon(Icons.visibility, color: Colors.grey, size: 40.sp),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
