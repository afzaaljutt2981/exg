import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../global/helper/custom_sized_box.dart';
import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({ required this.showUSerGuide, super.key});
final bool showUSerGuide;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  @override
  Widget build(BuildContext context) {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () => scaffoldKey.currentState!.openEndDrawer(),
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