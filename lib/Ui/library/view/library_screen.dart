import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../drawer/view/drawer_view.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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
                libraryWidget(
                    "AF with LBBB", "assets/images/library/AF with LBBB.jpg"),
                libraryWidget(
                    "Anterior STEMI with reciprocal change no rhythm strip",
                    "assets/images/library/Anterior STEMI with reciprocal change no rhythm strip.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Antero-lateral STEMI",
                    "assets/images/library/Antero-lateral STEMI .jpg"),
                libraryWidget("Atrial Fibrillaition with Digoxin effect",
                    "assets/images/library/Atrial Fibrillaition with Digoxin effect.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Bifasicular Block",
                    "assets/images/library/Bifasicular Block.jpg"),
                libraryWidget("Electrical alternans",
                    "assets/images/library/Elecrtrical alternans.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Green lead fallen off",
                    "assets/images/library/Green lead fallen off.jpg"),
                libraryWidget("hyperkalaemia 1",
                    "assets/images/library/hyperkalaemia 1.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("hyperkalaemia 2",
                    "assets/images/library/hyperkalaemia 2.jpg"),
                libraryWidget("Hypokalaemia (1)",
                    "assets/images/library/Hypokalaemia (1).jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Incomplete LBBB",
                    "assets/images/library/Incomplete LBBB.jpg"),
                libraryWidget("Inferior STEMI",
                    "assets/images/library/Inferior STEMI.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Lateral Q-wave Infarct",
                    "assets/images/library/Lateral Q-wave Infarct.jpg"),
                libraryWidget("LBBB", "assets/images/library/LBBB.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Left axis deviation",
                    "assets/images/library/Left axis deviation.jpg"),
                libraryWidget("Left posterior fascicular block",
                    "assets/images/library/Left posterior fascicular block.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Left-bundle-branch-block",
                    "assets/images/library/Left-bundle-branch-block.jpg"),
                libraryWidget("LVH with strain",
                    "assets/images/library/LVH with strain.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Monomorphic VT with northwest axis",
                    "assets/images/library/Monomorphic VT with northwest axis.jpg"),
                libraryWidget("Normal Sinus Rhythm",
                    "assets/images/library/Normal Sinus Rhythm.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("NSTEMI", "assets/images/library/NSTEMI.jpg"),
                libraryWidget("Orthodromic AVRT copy",
                    "assets/images/library/Orthodromic AVRT copy.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("pericardia effusion_tamponade",
                    "assets/images/library/pericardia effusion_tamponade.jpg"),
                libraryWidget("PericarditisMyocarditis",
                    "assets/images/library/PericarditisMyocarditis.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Posterior STEMI",
                    "assets/images/library/Posterior STEMI.jpg"),
                libraryWidget("RBBB", "assets/images/library/RBBB.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("RBBB1", "assets/images/library/RBBB1.jpg"),
                libraryWidget("Right-bundle-branch-block",
                    "assets/images/library/Right-bundle-branch-block.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("RVH with strain",
                    "assets/images/library/RVH with strain.jpg"),
                libraryWidget("S1Q3T3", "assets/images/library/S1Q3T3.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget(
                    "Sine wave", "assets/images/library/Sine wave.jpg"),
                libraryWidget("Sinus rhythm 12 lead",
                    "assets/images/library/Sinus rhythm 12 lead.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget(
                    "Sinus Rhythm", "assets/images/library/Sinus Rhythm.jpg"),
                libraryWidget("Sinus Tachycardia",
                    "assets/images/library/Sinus Tachycardia.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("STEMI (anterior)",
                    "assets/images/library/STEMI (anterior).jpg"),
                libraryWidget("STEMI (antero-septal)",
                    "assets/images/library/STEMI (antero-septal).jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("STEMI (inferior with Q-waves)",
                    "assets/images/library/STEMI (inferior with Q-waves).jpg"),
                libraryWidget("Trifascicular Block",
                    "assets/images/library/Trifascicular Block.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget(
                    "TWI NSTEMI", "assets/images/library/TWI NSTEMI.jpg"),
                libraryWidget(
                    "VT negative concordance and extreme axis deviation",
                    "assets/images/library/VT negative concordance and extreme axis deviation.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("VT positive concordance",
                    "assets/images/library/VT positive concordance.jpg"),
                libraryWidget("VT with AV dissociation",
                    "assets/images/library/VT with AV dissociation.jpg")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("Wellens Syndrome Type A",
                    "assets/images/library/Wellens Syndrome Type A.jpg"),
                libraryWidget("Wellens Syndrome Type A",
                    "assets/images/library/Wellens Syndrome Type A.png")
              ],
            ),
            CustomSizeBox(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                libraryWidget("WPW AVRT", "assets/images/library/WPW AVRT.jpg"),
                libraryWidget("WPW AVRT", "assets/images/library/WPW AVRT.jpg")
              ],
            ),
            CustomSizeBox(40.h),
          ],
        ),
      ),
    );
  }

  Widget libraryWidget(String text, String image) {
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
            height: 70.h,
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
