import 'package:exg/Ui/home/view/home_view.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../drawer/view/drawer_view.dart';
import 'login_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _LoginViewState extends State<LoginView> {
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
                image: const AssetImage('assets/images/splash_screen.png'),
                height: 90.sp,
              ),
            ),
            Center(
              child: Text(
                "UNDERGRADUATE ECG \nTEACHING",
                textAlign: TextAlign.center,
                style: AppTextStyle.luloClean(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueColor),
              ),
            ),
            CustomSizeBox(25.h),
            Center(
              child: Container(
                color: Colors.yellow,
                child: Image(
                  image: const AssetImage('assets/images/login_characters.png'),
                  height: 300.sp,
                ),
              ),
            ),
            CustomSizeBox(30.h),
            text("Log in", onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (route) => false);
            }),
            CustomSizeBox(10.h),
            text("Sign Up", onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget text(String text, {required Function onTap}) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: AppTextStyle.ralewayFont(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.blueColor),
        ),
      ),
    );
  }
}
