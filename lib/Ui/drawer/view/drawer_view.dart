import 'package:exg/Ui/authentication/view/login_view.dart';
import 'package:exg/Ui/beginners_tutorials/view/beginners_screen.dart';
import 'package:exg/Ui/home/view/home_view.dart';
import 'package:exg/Ui/intermediate_tutorials/view/intermediate_screen.dart';
import 'package:exg/Ui/pricing_plan/view/plan_view.dart';
import 'package:exg/Ui/rhythm_strips/view/rhythm_strips.dart';
import 'package:exg/Ui/splash_screen/view/create_splash.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:exg/global/utils/global_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../advance_tutorial/view/advance_screen.dart';
import '../../library/view/library_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.blueColor.withOpacity(0.75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizeBox(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          right: 20.sp,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/EXG_logo_heart.png'),
                    height: 120.sp,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                // CustomSizeBox(20.h),
                Padding(
                  padding: EdgeInsets.only(left: 35.w, top: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView(showUSerGuide: false,)),
                          (route) => false);
                    },
                    child: Text(
                      "Home",
                      style: AppTextStyle.ralewayFont(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                heading("Tutorials"),
                tutorialsPlans("Beginner", onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BeginnerScreen()),
                  );
                }),
                tutorialsPlans("Intermediate", onTap: () {
                  // int tokenValue =
                  //     int.parse(preferences.get('countLength').toString());
                  if (preferences.get('startup_session') == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView(showUSerGuide: false,)),
                    );
                  } else if (preferences.get('startup_session') != null &&
                      preferences.get('countLength') != null &&
                      int.parse(preferences.get('countLength').toString()) >
                          7) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntermediateScreen()),
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PricingScreen()),
                    );
                  }
                }),
                tutorialsPlans("Advanced", onTap: () {
                  if (preferences.get('startup_session') == null) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView(showUSerGuide: false,)),
                    );
                  } else if (preferences.get('startup_session') != null &&
                      preferences.get('countLength') != null &&
                      int.parse(preferences.get('countLength').toString()) >
                          7) {
                            Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdvanceScreen()),
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PricingScreen()),
                    );
                  }
                }),
                heading("ECG Library"),
                tutorialsPlans("Rhythm Strips", onTap: () {
                   if (preferences.get('startup_session') == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView(showUSerGuide: false,)),
                    );
                  } else if (preferences.get('startup_session') != null &&
                      preferences.get('countLength') != null &&
                      int.parse(preferences.get('countLength').toString()) >
                          7) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RhythmStrips()),
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PricingScreen()),
                    );
                  }
               
                }),
                tutorialsPlans("12 Lead ECGs", onTap: () {
                  if (preferences.get('startup_session') == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView(showUSerGuide: false,)),
                    );
                  } else if (preferences.get('startup_session') != null &&
                      preferences.get('countLength') != null &&
                      int.parse(preferences.get('countLength').toString()) >
                          7) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LibraryScreen()),
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PricingScreen()),
                    );
                  }
                 
                }),
                preferences.get('startup_session') != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 30.w, top: 40.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: AppColors.redColor,
                              size: 24.sp,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Hive.openBox("appBox").then((box) {
                                  preferences.put('startup_session', null);
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateSplashScreen()),
                                    (route) => false);
                              },
                              child: Text(
                                "Logout",
                                style: AppTextStyle.ralewayFont(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            )),
      ),
    );
  }

  Widget heading(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, top: 20.h),
      child: Text(
        text,
        style: AppTextStyle.ralewayFont(
            fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget tutorialsPlans(String text, {required Function onTap}) {
    return Padding(
      padding: EdgeInsets.only(left: 60.w, top: 15.h),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          text,
          style: AppTextStyle.ralewayFont(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
