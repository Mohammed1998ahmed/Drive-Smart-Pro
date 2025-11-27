import 'package:drivesmart/core/themes/colors.dart';
import 'package:drivesmart/feature/educational_content/ui/listViewVideoWidght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ListViewImages.dart';
import 'listviewFilePdf.dart';

class MyTabBarInColumn extends StatefulWidget {
  @override
  _MyTabBarInColumnState createState() => _MyTabBarInColumnState();
}

class _MyTabBarInColumnState extends State<MyTabBarInColumn>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 1300.h,
      child: Column(
        children: [
          /// ---- الـ TabBar داخل الـ Column ----
          TabBar(
            controller: _tabController,
            labelColor: Colors_App.primaryColor,
            indicatorColor: Colors_App.primaryColor,
            labelStyle: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "الفيديوهات",
              ),
              Tab(text: "الملفات"),
              Tab(text: "الصور"),
            ],
          ),

          /// ---- لازم Expanded لحتى يشتغل TabBarView داخل Column ----
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                GridVideoPlayerWithButton(),
                FilePdfWidght(),
                PdfCardGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
