import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/helper/custom_sized_box.dart';
import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
            child: Padding(
              padding: EdgeInsets.only(right: 23.sp),
              child: Icon(
                Icons.menu,
                color: AppColors.blueColor,
                size: 40.sp,
              ),
            ),
          )
        ],
      ),
      endDrawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: const AssetImage('assets/images/EXG_main_logo.png'),
                height: 80.sp,
              ),
            ),
            CustomSizeBox(10.h),
            Center(
              child: Image(
                image: const AssetImage('assets/images/welcome_home_image.png'),
                height: 250.sp,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            CustomSizeBox(30.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text("Build your", AppColors.blueColor),
                  text(" ECG skills", AppColors.redColor),
                  text(" from", AppColors.blueColor)
                ],
              ),
            ),
            Center(child: text("the ground up", AppColors.blueColor)),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: const Image(
                  image: AssetImage('assets/images/character_heads.png'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomSizeBox(15.h)
          ],
        ),
      ),
    );
  }

  Widget text(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyle.markerFont(
          fontSize: 23.sp, fontWeight: FontWeight.bold, color: color),
    );
  }
}
