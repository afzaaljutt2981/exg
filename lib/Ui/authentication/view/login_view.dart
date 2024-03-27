import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../drawer/view/drawer_view.dart';
import 'create_login_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({required this.showUSerGuide,  super.key});
final bool showUSerGuide;
  @override
  State<LoginView> createState() => _LoginViewState();
}


class _LoginViewState extends State<LoginView> {
   TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey menuKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
     
     
    if (widget.showUSerGuide) {
        _showTutorialCoachmark();
    }
      // if (preferences.get('userGuide') == null) {
      //   if (preferences.get('userGuide') != 'true') {
      //     _showTutorialCoachmark();
      //   }
      // }
    });
    super.initState();
  }

  void _showTutorialCoachmark() {
    _initTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      hideSkip: true,
      pulseEnable: false,
      colorShadow: const Color(0xFF36454F),
      alignSkip: Alignment.topRight,
      // onFinish: () {
      //   preferences.put(
      //     'userGuide',
      //     'true',
      //   );
      // },
    )..show(context: context);
  }

  void _initTarget() {
    targets = [
      TargetFocus(
        identify: "menu-key",
        keyTarget: menuKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Tap here to start learning",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),
    ];
  }

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
                key: menuKey,
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


class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.text,
    this.skip = "Skip",
    this.next = "Finish",
    this.onSkip,
    this.onNext,
  });

  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;

  @override
  State<CoachmarkDesc> createState() => _CoachmarkDescState();
}

class _CoachmarkDescState extends State<CoachmarkDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, right: 1.w),
      child: Text(widget.text,
          style: AppTextStyle.luloClean(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}