import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../drawer/view/drawer_view.dart';
import 'create_login_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}


class _LoginViewState extends State<LoginView> {
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
      endDrawer: const MyDrawer(),
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
                Navigator.push(
                              context,
                              PageTransition(
                                childCurrent: widget,
                                type: PageTransitionType.rightToLeft,
                                // alignment: Alignment.center,
                                duration: const Duration(milliseconds: 200),
                                reverseDuration:
                                    const Duration(milliseconds: 200),
                                child:CreateLoginScreen(screenType: "Log in",),
                              ),
                            );
             
            }),
            CustomSizeBox(10.h),
            text("Sign Up", onTap: () {
                Navigator.push(
                              context,
                              PageTransition(
                                childCurrent: widget,
                                type: PageTransitionType.rightToLeft,
                                // alignment: Alignment.center,
                                duration: const Duration(milliseconds: 200),
                                reverseDuration:
                                    const Duration(milliseconds: 200),
                                child:CreateLoginScreen(screenType: "Sign Up",)
                              ),
                            );
              
            }),
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
