import 'package:exg/global/extras/download_file.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';

class BeginnerScreen extends StatefulWidget {
  const BeginnerScreen({super.key});

  @override
  State<BeginnerScreen> createState() => _BeginnerScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _BeginnerScreenState extends State<BeginnerScreen> {
  @override
  Widget build(BuildContext context) {
    String details =
        'Welcome to your first EXG tutorial on ECG interaption. Each lesson comes with video tutorials that outline the main learning points of the session. After you have watched the videos, you can move on the text based portion of the lessons where some of the topics are covered in more detail. Each section ends with a short quiz to help you consolidate your learning. Once you have completed all 6 lessons. You should move on to complete the end of block exam. ';
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
                    text("B", AppColors.redColor, 12),
                    text("EGINNER", AppColors.blueColor, 12)
                  ],
                ),
              ),
              Center(child: text("tutorial", AppColors.blueColor, 10)),
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
                        text("getting ", AppColors.blueColor, 12),
                        text("s", AppColors.redColor, 12),
                        text("tarted", AppColors.blueColor, 12)
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        lessons(
                            'assets/images/beginners/beginner_lesson_1.png',
                            "Lesson 1.",
                            "Anotmy",
                            "Learn about the anotmy of the heart and cardic condunting syster"),
                        lessons(
                            'assets/images/beginners/beginner_lesson_2.png',
                            "Lesson 2.",
                            "ECG Setup",
                            "Learn about the components of the ECG and how to set up the electrodes on a patient"),
                      ],
                    ),
                    CustomSizeBox(45.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        lessons(
                            'assets/images/beginners/beginner_lesson_3.png',
                            "Lesson 3.",
                            "Basic ECG Waveforms",
                            "Learn about the P-wave, QRS complex and T-wave,"),
                        lessons(
                            'assets/images/beginners/beginner_lesson_4.png',
                            "Lesson 4.",
                            "ECG physics",
                            "Learn how the ECG electrodes detect voltage change within the heart"),
                      ],
                    ),
                    CustomSizeBox(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        lessons(
                            'assets/images/beginners/beginner_lesson_5.png',
                            "Lesson 5.",
                            "Basic interpretation (rhythm)",
                            "Learn our six step approach to rhythm analysis as used by the UK resuscitation council"),
                      ],
                    ),
                    CustomSizeBox(55.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text("End of block", AppColors.blueColor, 12),
                          text(" exam", AppColors.redColor, 12),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.w),
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
                    CustomSizeBox(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        documents("Paper", onTap: () {
                          downloadDocument(
                              'assets/Docs/beginner/block_exam_PDD.pdf',
                              'EXG Beginner Question Paper.pdf'
                              );
                        }),
                        documents("Answers", onTap: () {
                          downloadDocument(
                              'assets/Docs/beginner/block_exam_answers.pdf',
                              'EXG Beginner Answer Paper.pdf'
                              );
                        })
                      ],
                    ),
                    CustomSizeBox(55.h),
                  ],
                ),
              ),
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
              fontSize: 18.sp,
              fontWeight: FontWeight.normal),
        ),
        CustomSizeBox(10.h),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Image(
            image: const AssetImage('assets/images/document_picture.png'),
            height: 85.sp,
          ),
        ),
      ],
    );
  }

  Widget text(String text, Color color, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyle.luloClean(
          fontSize: size.sp, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget lessons(
      String image, String lessonText, String subHeading, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: 100.sp,
        ),
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
    );
  }
}
