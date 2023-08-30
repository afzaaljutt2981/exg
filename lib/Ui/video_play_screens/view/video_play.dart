import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../global/utils/app_text_styles.dart';

// ignore: must_be_immutable
class VideoPlayScreen extends StatefulWidget {
  VideoPlayScreen({required this.lessonText, required this.url, super.key});
  String lessonText;
  String url;
  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  @override
  void initState() {
    super.initState();
    Uri url = Uri.parse(widget.url);
    flickManager = FlickManager(
      autoPlay: true,
        videoPlayerController: VideoPlayerController.networkUrl(url));
  }

  FlickManager? flickManager;
  @override
  void dispose() {
    flickManager!.dispose();
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
        title: InkWell(
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
              size: 25.sp,
            ),
          ),
        ),
      ),
      body: Column(
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
          CustomSizeBox(20.h),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(
                    progressBarSettings: FlickProgressBarSettings(
                      bufferedColor: Colors.black12,
                      handleColor: Colors.black,
                      playedColor: AppColors.blueColor,
                      backgroundColor: const Color.fromARGB(51, 22, 44, 33),
                    ),
                  ),
                ),
                flickManager: flickManager!),
          )
        ],
      ),
    );
  }
}
