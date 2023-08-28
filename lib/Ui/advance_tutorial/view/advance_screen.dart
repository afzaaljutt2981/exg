import 'package:exg/global/extras/download_file.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';
import '../../video_play_screens/view/video_play.dart';

class AdvanceScreen extends StatefulWidget {
  const AdvanceScreen({super.key});

  @override
  State<AdvanceScreen> createState() => _AdvanceScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _AdvanceScreenState extends State<AdvanceScreen> {
  @override
  Widget build(BuildContext context) {
    String details =
        "Welcome to the EXG advanced tutorial. In this section we will focus predominantly on the diagnosis of arrhythmias. These are split into tachy and brady arrhythmias of both atrial and ventricular origin. The final part of the course looks at metabolic problems of the heart, which can also result in the formation of arrhythmias.";
    String endBlockDetails =
        "Once you have completed all 4 lessons, test yourself with our end of block exam. You can retake this test any time you like whilst your membership is active";
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
                    headingText("A", AppColors.redColor, 12),
                    headingText("DVANCED", AppColors.blueColor, 12)
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 70.w, right: 70.w, top: 15.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        lessons(
                            'assets/images/advanced/1.png',
                            "Lesson 1.",
                            "Atrial Arrhythmias",
                            "This section covers regular and irregular narrow complex tachycardias"),
                        lessons(
                            'assets/images/advanced/2.png',
                            "Lesson 2.",
                            "Ventricular Arrhythmias",
                            "This section covers regular and irregular broad complex tachycardias"),
                      ],
                    ),
                    CustomSizeBox(45.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        lessons(
                            'assets/images/advanced/3.png',
                            "Lesson 3.",
                            "Heart Blocks",
                            "Learn how to differentiate 1st, 2nd and 3rd degree heart blocks"),
                        lessons(
                            'assets/images/advanced/4.png',
                            "Lesson 4.",
                            "Metabolic Derrangement",
                            "Learn about the roles of Na+, K+ and Ca2+ within the cardiac cells"),
                      ],
                    ),
                    // CustomSizeBox(25.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     lessons(
                    //         'assets/images/beginners/beginner_lesson_5.png',
                    //         "Lesson 5.",
                    //         "Basic interpretation (rhythm)",
                    //         "Learn our six step approach to rhythm analysis as used by the UK resuscitation council"),
                    //   ],
                    // ),
                    CustomSizeBox(65.h),
                    Padding(
                      padding: EdgeInsets.only(left: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          text("End of Block", AppColors.blueColor, 15),
                          text(" Exam", AppColors.redColor, 15),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          endBlockDetails,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.ralewayFont(
                              fontSize: 9.sp,
                              height: 1.8,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    CustomSizeBox(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        documents("Paper", onTap: () {
                          downloadDocument(
                              'assets/docs/advance/advanced_block_exam_question.pdf',
                              'EXG Advance Question Paper.pdf');
                        }),
                        documents("Answers", onTap: () {
                          downloadDocument(
                              'assets/docs/advance/advanced_block_exam_answers.pdf',
                              'EXG Advance Answer Paper.pdf');
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
          Image(
            image: AssetImage(image),
            height: 100.sp,
          ),
          CustomSizeBox(10.h),
          Text(
            lessonText,
            style: AppTextStyle.markerFont(
                color: AppColors.blueColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
          Text(
            subHeading,
            style: AppTextStyle.markerFont(
                color: AppColors.redColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          CustomSizeBox(3.h),
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
