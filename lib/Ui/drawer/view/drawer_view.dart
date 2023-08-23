import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                child: Text(
                  "Home",
                  style: AppTextStyle.ralewayFont(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              heading("Tutorials"),
              tutorialsPlans("Beginner"),
              tutorialsPlans("Intermediate"),
              tutorialsPlans("Advanced"),
              heading("ECG Library"),
              tutorialsPlans("Rhythm Strips"),
              tutorialsPlans("12 Lead ECGs"),
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

  Widget tutorialsPlans(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 60.w, top: 15.h),
      child: Text(
        text,
        style: AppTextStyle.ralewayFont(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
