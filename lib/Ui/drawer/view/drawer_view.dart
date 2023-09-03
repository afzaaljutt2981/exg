import 'package:exg/Ui/beginners_tutorials/view/beginners_screen.dart';
import 'package:exg/Ui/home/view/home_view.dart';
import 'package:exg/Ui/intermediate_tutorials/view/intermediate_screen.dart';
import 'package:exg/Ui/pricing_plan/view/plan_view.dart';
import 'package:exg/Ui/rhythm_strips/view/rhythm_strips.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../advance_tutorial/view/advance_screen.dart';
import '../../library/view/library_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            builder: (context) => const HomeView()),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BeginnerScreen()),
                );
              }),
              tutorialsPlans("Intermediate", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IntermediateScreen()),
                );
              }),
              tutorialsPlans("Advanced", onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdvanceScreen()));
              }),
              heading("ECG Library"),
              tutorialsPlans("Rhythm Strips", onTap: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RhythmStrips()));
              }),
              tutorialsPlans("12 Lead ECGs", onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LibraryScreen()));
              }),
            ],
          )),
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
