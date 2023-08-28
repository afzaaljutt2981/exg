import 'package:exg/global/extras/download_file.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';
import '../../video_play_screens/view/video_play.dart';

class IntermediateScreen extends StatefulWidget {
  const IntermediateScreen({super.key});

  @override
  State<IntermediateScreen> createState() => _IntermediateScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _IntermediateScreenState extends State<IntermediateScreen> {
  @override
  Widget build(BuildContext context) {
    String details =
        "Welcome to the intermediate section of the EXG course. This action focusses on identifying structural pathology within the heart. In order to do this, it's really important that you have a good understanding of the basics of the ECG. So, if you haven't yet completed our beginner's tutorial, we recomended you start there. If you've already finished all off those modules then you can move on to complete the end of block exam once you are all done ";
    String endBlockDetails =
        "Once you have completed all 5 lessons, test yourself with our end of block exam. We recommend that you don't progress to the intermediate tutorial until you have scored over 70% in your exam. You can retake this test any time you like whilst your membership is active";
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: const AssetImage('assets/images/splash_screen.png'),
                  height: 80.sp,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headingText("I", AppColors.redColor, 12),
                    headingText("NTERMEDIATE", AppColors.blueColor, 12)
                  ],
                ),
              ),
              Center(child: headingText("tutorial", AppColors.blueColor, 10)),
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
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 30.h, right: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        headingText("getting ", AppColors.blueColor, 12),
                        headingText("s", AppColors.redColor, 12),
                        headingText("tarted", AppColors.blueColor, 12)
                      ],
                    ),
                    Text(
                      details,
                      style: AppTextStyle.ralewayFont(
                          fontSize: 10.sp,
                          height: 2,
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.normal),
                    ),
                    CustomSizeBox(35.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    lessons(
                        'assets/images/intermediate/intermediate_lesson_1.gif',
                        "Lesson 1.",
                        "Cardiac Axis",
                        "Learn about the anotmy of the heart and cardic condunting syster"),
                    lessons(
                        'assets/images/intermediate/12345.png',
                        "Lesson 2.",
                        "ECG Setup",
                        "Cardiac axis is the general direction of electrical activity within the heart"),
                  ],
                ),
              ),
              CustomSizeBox(45.h),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    lessons(
                        'assets/images/intermediate/3.png',
                        "Lesson 3.",
                        "Pericarditis and Effusion",
                        "Learn about how inflammation of the pericardium affects the ECG"),
                    lessons(
                        'assets/images/intermediate/4.png',
                        "Lesson 4.",
                        "Cardiac Hypertrophy",
                        "Learn about the changes that hypertrophy of each chamber causes"),
                  ],
                ),
              ),
              CustomSizeBox(45.h),
              Padding(
                padding: EdgeInsets.only(left: 27.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    lessons(
                        'assets/images/intermediate/intermediate_lesson_5.gif',
                        "Lesson 5.",
                        "Bundle Branch Blocks",
                        "Learn how the ECG can be used to detect issues with bundle branch conduction"),
                    // lessons('assets/images/intermediate/6.png', "Lesson 6.",
                    //     "Fascicular Blocks", "Coming soon"),
                  ],
                ),
              ),
              CustomSizeBox(65.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text("End of Block", AppColors.blueColor, 14),
                          text(" E", AppColors.blueColor, 14),
                          text("x", AppColors.redColor, 14),
                          text("am", AppColors.blueColor, 14),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.w),
                        child: Text(
                          endBlockDetails,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.ralewayFont(
                              fontSize: 9.sp,
                              height: 1.8,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    CustomSizeBox(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        documents("Paper", onTap: () {
                          downloadDocument(
                              'assets/Docs/intermediate/Intermedate_block_exam_questions.pdf',
                              'EXG Intermediate Question Paper.pdf');
                        }),
                        documents("Answers", onTap: () {
                          downloadDocument(
                              'assets/Docs/intermediate/Intermedate_block_exam_answers.pdf',
                              'EXG Intermediate Answer Paper.pdf');
                        })
                      ],
                    ),
                  ],
                ),
              ),
              CustomSizeBox(45.h),
            ],
          ),
        ));
  }

  Widget documents(String text, {required Function onTap}) {
    return Column(
      children: [
        Text(
          text,
          style: AppTextStyle.markerFont(
              color: AppColors.blueColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
        CustomSizeBox(10.h),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Image(
            image: const AssetImage('assets/images/document_picture.png'),
            height: 75.sp,
          ),
        ),
      ],
    );
  }

  Widget headingText(String text, Color color, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyle.luloClean(
          fontSize: size.sp, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget text(String text, Color color, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyle.markerFont(
          fontSize: size.sp, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget lessons(
      String image, String lessonText, String subHeading, String detail) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayScreen(
                      lessonText: subHeading,
                      url:
                          'https://drive.google.com/drive/u/0/folders/1c6lhjsIgVo5P5a6jCad-CgnLlNNySD_n',
                    )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lessonText,
            style: AppTextStyle.markerFont(
                color: AppColors.blueColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal),
          ),
          Text(
            subHeading,
            style: AppTextStyle.markerFont(
                color: AppColors.redColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          CustomSizeBox(15.h),
          Image(
            image: AssetImage(image),
            height: 100.sp,
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              detail,
              style: AppTextStyle.markerFont(
                  color: Colors.grey,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
