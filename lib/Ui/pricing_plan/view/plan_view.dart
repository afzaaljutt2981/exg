import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/utils/app_colors.dart';
import '../../drawer/view/drawer_view.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final websiteUrl = Uri.parse('https://www.exg-learning.com/join-us');
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
            CustomSizeBox(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                'Get a pricing plan to access this page',
                textAlign: TextAlign.center,
                style: AppTextStyle.ralewayFont(fontSize: 20.sp),
              ),
            ),
            CustomSizeBox(55.h),
            Container(
              color: Colors.red,
              child: Text(
                'Explore Plans',
                textAlign: TextAlign.center,
                style: AppTextStyle.markerFont(
                    fontSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            CustomSizeBox(15.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  launchUrl(websiteUrl, mode: LaunchMode.externalApplication);
                });
              },
              child: Text(
                'Go to Site',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'MarkerFeltNarrow',
                  fontSize: 13.sp,
                  decorationThickness: 7.sp,
                  color: Colors.black,
                ),
              ),
            ),

            //
            ////
            /////
            ///
            ///
            ///
            ///
            /// // Link(
            //     uri: websiteUrl,
            //     target: LinkTarget.defaultTarget,
            //     builder: (context, openLink) {
            //       return TextButton(
            //         onPressed: openLink,
            //         child: Text(
            //           'Go to Site',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             decoration: TextDecoration.underline,
            //             fontFamily: 'MarkerFeltNarrow',
            //             fontSize: 13.sp,
            //             decorationThickness: 7.sp,
            //             color: Colors.black,
            //           ),
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }

  Future<void> lunchURL(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Can't launch url";
    }
  }
}
