import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesTable extends StatelessWidget {
  final List<Map<String, dynamic>> employees = [
    {
      "name": "محمود خالد",
      "role": "موظف استقبال",
      "phone": "222 111 0987",
      "email": "mahmoud.emp@example.com",
      "department": "الاستقبال",
      "status": "نشط",
      "date": "2025/01/10",
    },
    {
      "name": "سارة محمود",
      "role": "مشرفة دورات",
      "phone": "333 222 0567",
      "email": "sara.emp@example.com",
      "department": "الإدارة",
      "status": "نشط",
      "date": "2025/01/04",
    },
    {
      "name": "فؤاد يوسف",
      "role": "محاسب",
      "phone": "444 333 0145",
      "email": "fouad.emp@example.com",
      "department": "المالية",
      "status": "غير نشط",
      "date": "2024/12/27",
    },
    {
      "name": "ريم أحمد",
      "role": "سكرتيرة",
      "phone": "555 444 0982",
      "email": "reem.emp@example.com",
      "department": "الإدارة",
      "status": "نشط",
      "date": "2024/12/20",
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
              DataColumn(label: Text("الوظيفة")),
              DataColumn(label: Text("الهاتف")),
              DataColumn(label: Text("البريد الإلكتروني")),
              DataColumn(label: Text("القسم")),
              DataColumn(label: Text("الحالة")),
              DataColumn(label: Text("تاريخ التعيين")),
              DataColumn(label: Text("إجراءات")),
            ],
            rows: employees.map((emp) {
              return DataRow(
                cells: [
                  // الاسم
                  DataCell(Text(emp["name"])),

                  // الوظيفة
                  DataCell(Text(emp["role"])),

                  // الهاتف + أيقونة
                  DataCell(
                    Row(
                      children: [
                        Icon(Icons.phone, size: 28.sp, color: Colors.blue),
                        SizedBox(width: 8.w),
                        Text(emp["phone"]),
                      ],
                    ),
                  ),

                  // البريد + أيقونة + زر نسخ
                  DataCell(
                    Row(
                      children: [
                        Text(emp["email"]),
                        SizedBox(width: 10.w),
                        Icon(Icons.email, size: 30.sp, color: Colors.grey),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: emp["email"]));
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

                  // القسم
                  DataCell(
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        emp["department"],
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  // الحالة
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: emp["status"] == "نشط"
                            ? Colors.green.withOpacity(0.2)
                            : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        emp["status"],
                        style: TextStyle(
                          color: emp["status"] == "نشط"
                              ? Colors.green
                              : Colors.red,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),

                  // تاريخ التعيين
                  DataCell(Text(emp["date"])),

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
