import 'package:exg/global/extras/download_file.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';
import '../../video_play_screens/view/four_videos_play.dart';
import '../../video_play_screens/view/video_play.dart';

class IntermediateScreen extends StatefulWidget {
  const IntermediateScreen({super.key});

  @override
  State<IntermediateScreen> createState() => _IntermediateScreenState();
}

class _IntermediateScreenState extends State<IntermediateScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String details =
        "Welcome to the intermediate section of the EXG course. This saction focusses on identifying structural pathology within the heart. In order to do this, it's really important that you have a good understanding of the basics of the ECG. So, if you haven't yet completed our beginner's tutorial, we recomended you start there.";
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
        endDrawer: const MyDrawer(),
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
                      textAlign: TextAlign.justify,
                    ),
                    CustomSizeBox(35.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    lessons(
                        1,
                        'assets/images/intermediate/intermediate_lesson_1.gif',
                        "Lesson 1.",
                        "Cardiac Axis",
                        "Cardiac axis is the general direction of electrical activity within the heart"),
                        
                    GestureDetector(
                      onTap: () {
                        var videoList = [];
                        videoList.add(
                            'https://video.wixstatic.com/video/c851b6_c7202b0b62f146e8947cd064d431da79/1080p/mp4/file.mp4');
                        videoList.add(
                            'https://video.wixstatic.com/video/c851b6_e3de63b50f8b465cb5565e965394cb7d/1080p/mp4/file.mp4');
                        videoList.add(
                            'https://video.wixstatic.com/video/c851b6_ddc21acaf55847f982512e57cf0d041a/1080p/mp4/file.mp4');
                        videoList.add(
                            'https://video.wixstatic.com/video/c851b6_3e894bd4b8464a1da44339b7c152bfae/1080p/mp4/file.mp4');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FourVideoPlayScreen(
                                      lessonText: 'myocardial infarctions',
                                      url: videoList,
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Lesson 2.',
                            style: AppTextStyle.markerFont(
                                color: AppColors.blueColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Myocardial Infarctions',
                            style: AppTextStyle.markerFont(
                                color: AppColors.redColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          CustomSizeBox(15.h),
                          Image(
                            image: const AssetImage(
                                'assets/images/intermediate/12345.png'),
                            height: 100.sp,
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              'Learn how to diagnose, localise and age a myocardial infarction',
                              style: AppTextStyle.markerFont(
                                  color: Colors.grey,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomSizeBox(45.h),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    lessons(
                        3,
                        'assets/images/intermediate/3.png',
                        "Lesson 3.",
                        "Pericarditis and Effusion",
                        "Learn about how inflammation of the pericardium affects the ECG"),
                    lessons(
                        4,
                        'assets/images/intermediate/4.png',
                        "Lesson 4.",
                        "Cardiac Hypertrophy",
                        "Learn about the changes that hypertrophy of each chamber causes"),
                  ],
                ),
              ),
              CustomSizeBox(45.h),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    lessons(
                        5,
                        'assets/images/intermediate/5.png',
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
                          textAlign: TextAlign.justify,
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
                              'assets/docs/intermediate/Intermedate_block_exam_questions.pdf',
                              'EXG Intermediate Question Paper.pdf');
                        }),
                        documents("Answers", onTap: () {
                          downloadDocument(
                              'assets/docs/intermediate/Intermedate_block_exam_answers.pdf',
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

  Widget lessons(int videoNumber, String image, String lessonText,
      String subHeading, String detail) {
    return GestureDetector(
      onTap: () {
        String url = videoNumber == 1
            ? "https://video.wixstatic.com/video/c851b6_0a3af45f65cb46f89cf3e38cb5eb8f67/1080p/mp4/file.mp4"
            //  : videoNumber == 2
            //    ? "https://video.wixstatic.com/video/c851b6_c7202b0b62f146e8947cd064d431da79/1080p/mp4/file.mp4"
            : videoNumber == 3
                ? "https://video.wixstatic.com/video/c851b6_8d22d6f733eb4d2ab1ac052c0b110f91/1080p/mp4/file.mp4"
                : videoNumber == 4
                    ? "https://video.wixstatic.com/video/c851b6_5b68a8705d804e09a4e9f59d0b0186fd/1080p/mp4/file.mp4"
                    : videoNumber == 5
                        ? "https://video.wixstatic.com/video/c851b6_bcef90a9cfef42cbbedfb8036513810a/1080p/mp4/file.mp4"
                        : '';
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayScreen(
                      lessonText: subHeading,
                      url: url,
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
