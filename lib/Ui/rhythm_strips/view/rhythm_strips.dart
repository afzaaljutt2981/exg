import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../drawer/view/drawer_view.dart';

class RhythmStrips extends StatefulWidget {
  const RhythmStrips({super.key});

  @override
  State<RhythmStrips> createState() => _RhythmStripsState();
}



class _RhythmStripsState extends State<RhythmStrips> {
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Image(
                image: const AssetImage('assets/images/splash_screen.png'),
                height: 80.sp,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: const Image(
                  image: AssetImage('assets/images/character_heads.png'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomSizeBox(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("1st Degree HB",
                    "assets/images/rhythmStrips/1st Degree HB.jpg"),
                rhythmWidget("2nd Degree Mobitz II Heart Block",
                    "assets/images/rhythmStrips/2nd Degree Mobitz II Heart Block.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("2nd Degree Mobitz type I heart Block",
                    "assets/images/rhythmStrips/2nd Degree Mobitz type I heart Block.jpg"),
                rhythmWidget("2nd Degree Mobitz type II heart block",
                    "assets/images/rhythmStrips/2nd Degree Mobitz type II heart block.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("3rd Degree Heart Block",
                    "assets/images/rhythmStrips/3rd Degree Heart Block.jpg"),
                rhythmWidget("Agonal Rhythm",
                    "assets/images/rhythmStrips/Agonal Rhythm.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget(
                    "Asystole", "assets/images/rhythmStrips/Asystole.jpg"),
                rhythmWidget("Atrial Ectopic Beats",
                    "assets/images/rhythmStrips/Atrial Ectopic Beats.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Atrial flutter 2 to 1 conduction",
                    "assets/images/rhythmStrips/Atrial flutter 2 to 1 conduction.jpg"),
                rhythmWidget("Atrial Flutter 3 to 1 conduction",
                    "assets/images/rhythmStrips/Atrial Flutter 3 to 1 conduction.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Effect of adenosine",
                    "assets/images/rhythmStrips/Effect of adenosine.jpg"),
                rhythmWidget("Junctional Rhythm",
                    "assets/images/rhythmStrips/Junctional Rhythm.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget(
                    "P-mitrale", "assets/images/rhythmStrips/P-mitrale.jpg"),
                rhythmWidget("P-pulmonale",
                    "assets/images/rhythmStrips/P-pulmonale.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Pre-excited AF",
                    "assets/images/rhythmStrips/Pre-excited AF.jpg"),
                rhythmWidget("Sinus Bradycardia",
                    "assets/images/rhythmStrips/Sinus Bradycardia.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Torsades De Pointes",
                    "assets/images/rhythmStrips/Torsades De Pointes.jpg"),
                rhythmWidget("Ventricular Fibrillation",
                    "assets/images/rhythmStrips/Ventricular Fibrillation.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Ventricular Tachycadia (Monomorphic)",
                    "assets/images/rhythmStrips/Ventricular Tachycadia (Monomorphic).jpg"),
                rhythmWidget(
                    "Ventricular Tachycardia with fusion beats and capture beats",
                    "assets/images/rhythmStrips/Ventricular Tachycardia with fusion beats and capture beats.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rhythmWidget("Ventricular Trigeminy",
                    "assets/images/rhythmStrips/Ventricular Trigeminy.jpg"),
                rhythmWidget("Wolff-Parkinson-White Syndrome",
                    "assets/images/rhythmStrips/Wolff-Parkinson-White Syndrome.jpg"),
              ],
            ),
            CustomSizeBox(40.h),
          ],
        ),
      ),
    );
  }

  Widget rhythmWidget(String text, String image) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return seeFullImage(image, text);
            });
      },
      child: Column(
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyle.markerFont(
                  color: AppColors.blueColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          CustomSizeBox(10.h),
          Image(
            image: AssetImage(image),
            height: 30.h,
            width: 140.w,
          )
        ],
      ),
    );
  }

  Widget seeFullImage(String image, String text) {
    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.sp),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image)),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: AppTextStyle.ralewayFont(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
