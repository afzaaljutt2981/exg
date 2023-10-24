import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../global/utils/app_text_styles.dart';

// ignore: must_be_immutable
class TwoVideoPlayScreen extends StatefulWidget {
  TwoVideoPlayScreen(
      {required this.lessonText,
      required this.url,
      required this.text,
      super.key});
  String lessonText;
  // ignore: prefer_typing_uninitialized_variables
  var url;
  // ignore: prefer_typing_uninitialized_variables
  var text;
  @override
  State<TwoVideoPlayScreen> createState() => _TwoVideoPlayScreenState();
}

class _TwoVideoPlayScreenState extends State<TwoVideoPlayScreen> {
  @override
  void initState() {
    super.initState();
    Uri url1 = Uri.parse(widget.url[0]);
    Uri url2 = Uri.parse(widget.url[1]);
    flickManager1 = FlickManager(
      autoPlay: true,
        videoPlayerController: VideoPlayerController.networkUrl(url1));
    flickManager2 = FlickManager(
      autoPlay: false,
        videoPlayerController: VideoPlayerController.networkUrl(url2));
  }

  FlickManager? flickManager1;
  FlickManager? flickManager2;
  @override
  void dispose() {
    flickManager1!.dispose();
    flickManager2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            height: 35.sp,
            width: 35.sp,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5.sp)),
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: const AssetImage('assets/images/EXG_logo_white.png'),
                height: 30.sp,
              ),
            ),
            CustomSizeBox(10.h),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  widget.lessonText,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.luloClean(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            CustomSizeBox(30.h),
            text(widget.text[0]),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(
                  flickVideoWithControls: FlickVideoWithControls(
                      iconThemeData:
                      const IconThemeData(color: AppColors.blueColor),
                  textStyle:
                      const TextStyle(color: AppColors.blueColor),
                    controls: FlickPortraitControls(
                      progressBarSettings: FlickProgressBarSettings(
                        bufferedColor: Colors.black12,
                        handleColor: Colors.black,
                        playedColor: AppColors.blueColor,
                        backgroundColor: const Color.fromARGB(51, 22, 44, 33),
                      ),
                    ),
                  ),
                  flickManager: flickManager1!),
            ),
            CustomSizeBox(50.h),
            text(widget.text[1]),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(
                  flickVideoWithControls: FlickVideoWithControls(
                      iconThemeData:
                      const IconThemeData(color: AppColors.blueColor),
                  textStyle:
                      const TextStyle(color: AppColors.blueColor),
                    controls: FlickPortraitControls(
                      progressBarSettings: FlickProgressBarSettings(
                        bufferedColor: Colors.black12,
                        handleColor: Colors.black,
                        playedColor: AppColors.blueColor,
                        backgroundColor: const Color.fromARGB(51, 22, 44, 33),
                      ),
                    ),
                  ),
                  flickManager: flickManager2!),
            )
          ],
        ),
      ),
    );
  }

  Widget text(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Text(
        text,
        style: AppTextStyle.luloClean(color: Colors.white, fontSize: 9.sp),
      ),
    );
  }
}
