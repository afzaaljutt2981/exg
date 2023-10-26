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
  void dispose() {
    super.dispose();
  }

  List textList = [
    'Atrial Fibrillation With Left Bundle Branch Block',
    'Elecrtrical alternans',
    'Green lead fallen off',
    'Hyperkalaemia 1',
    'Hyperkalaemia 2',
    'Hyperkalaemia - sine wave',
    'Hypokalaemia',
    'Incomplete LBBB',
    'STEMI (Inferior)',
    'Left Bundle Branch Block',
    'Left Ventricular Hypertrophy with Strain Pattern',
    'Monomorphic VT with northwest axis',
    'NSTEMI',
    'Orthodromic AVRT',
    'Pericarditis / Myocarditis',
    'Posterior STEMI',
    'Trifasicular Block',
    'Right Bundle Branch Block + 1st degree AV block',
    'Right ventricular hypertrophy with strain pattern',
    'Pulmonary Embolism - S1Q3T3',
    'Sinus Rhythm',
    'NSTEMI with T-wave Inversion',
    'Ventricular Tachycardia with Positive Concordance',
    'Ventricular Tachycardia with AV dissociation',
    'AV Re-entry Tachycardia',
    'Atrial Fibrillaition with Digoxin effect',
    'Left axis deviation',
    'Lateral Q-wave Infarct',
    'Bifasicular Block',
    'Left Posterior Fascicular Block',
    'Sinus Tachycardia',
    'STEMI (anterior)',
    'STEMI (Antero-lateral distribution)',
    'STEMI (Antero-septal)',
    'STEMI (inferior with Q-waves)',
    'Wellens Syndrome Type A',
  ];

  List imagesList = [
    'https://static.wixstatic.com/media/c851b6_c7a625c16e60416db11d9b921da00075~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_c7a625c16e60416db11d9b921da00075~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_d9515d22f3d94803bcdf80c2cc6a48bc~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_d9515d22f3d94803bcdf80c2cc6a48bc~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_86a14838dde64b03bfe3569ffb300928~mv2.png/v1/fill/w_1145,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_86a14838dde64b03bfe3569ffb300928~mv2.png',
    'https://static.wixstatic.com/media/c851b6_7e71b60ebd41421d8b4dfee071294310~mv2.png/v1/fill/w_1206,h_716,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_7e71b60ebd41421d8b4dfee071294310~mv2.png',
    'https://static.wixstatic.com/media/c851b6_ef996f964446460fb1f57fb361febc48~mv2.png/v1/fill/w_1149,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_ef996f964446460fb1f57fb361febc48~mv2.png',
    'https://static.wixstatic.com/media/c851b6_06f57cc5ac984dedbc817541ac795cfb~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_06f57cc5ac984dedbc817541ac795cfb~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_df9681c0e2e1460880a852de0b83aec7~mv2.png/v1/fill/w_1151,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_df9681c0e2e1460880a852de0b83aec7~mv2.png',
    'https://static.wixstatic.com/media/c851b6_4afdcaf309be466e95577091e1f588c6~mv2.jpg/v1/fill/w_1163,h_718,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_4afdcaf309be466e95577091e1f588c6~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_bb52e6c479c74cbaa9ff70a4ce164576~mv2.png/v1/fill/w_1202,h_717,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_bb52e6c479c74cbaa9ff70a4ce164576~mv2.png',
    'https://static.wixstatic.com/media/c851b6_22c77fea66404233a288c0a4584f53a0~mv2.jpg/v1/fill/w_1162,h_718,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_22c77fea66404233a288c0a4584f53a0~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_a4f2d48c7e594af7ab617fb26b2406d3~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_a4f2d48c7e594af7ab617fb26b2406d3~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_d1064ffdf6bb4c30b923f8f9a3bb3668~mv2.jpg/v1/fill/w_1166,h_718,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_d1064ffdf6bb4c30b923f8f9a3bb3668~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_ca8b110944c44cbaa4cd21b72c7852cd~mv2.png/v1/fill/w_1182,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_ca8b110944c44cbaa4cd21b72c7852cd~mv2.png',
    'https://static.wixstatic.com/media/c851b6_557481da3cef49e8a92e7bc5d3376a02~mv2.png/v1/fill/w_1132,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_557481da3cef49e8a92e7bc5d3376a02~mv2.png',
    'https://static.wixstatic.com/media/c851b6_424089160e424990be67aab3e1a097e8~mv2.jpg/v1/fill/w_1162,h_718,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_424089160e424990be67aab3e1a097e8~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_f094efb4ad9e468198b9f6c4c6e2afcb~mv2.png/v1/fill/w_1166,h_682,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_f094efb4ad9e468198b9f6c4c6e2afcb~mv2.png',
    'https://static.wixstatic.com/media/c851b6_03c9d03a2b9c4d1aabbee3096acc3a07~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_03c9d03a2b9c4d1aabbee3096acc3a07~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_cc610e2dbfa0444b8eb048e71dae5c91~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_cc610e2dbfa0444b8eb048e71dae5c91~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_e87c563dd113451792240dd9f0e2b706~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_e87c563dd113451792240dd9f0e2b706~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_dee3879caca34de3ae6812b6d0392a58~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_dee3879caca34de3ae6812b6d0392a58~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_8de160edaace44a091882dc8e8abb17b~mv2.jpg/v1/fill/w_1162,h_718,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_8de160edaace44a091882dc8e8abb17b~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_6023987800ec460dbeefefa82c5bc88a~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_6023987800ec460dbeefefa82c5bc88a~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_a73a54b4afd6489484ae89665b2eca96~mv2.png/v1/fill/w_1140,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_a73a54b4afd6489484ae89665b2eca96~mv2.png',
    'https://static.wixstatic.com/media/c851b6_2cf1d4c1d46e4db6bc282e9eab3fae4c~mv2.png/v1/fill/w_1150,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_2cf1d4c1d46e4db6bc282e9eab3fae4c~mv2.png',
    'https://static.wixstatic.com/media/c851b6_5a4cdfdb1e694b6a9168fcefcb143c9a~mv2.png/v1/fill/w_1200,h_716,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_5a4cdfdb1e694b6a9168fcefcb143c9a~mv2.png',
    'https://static.wixstatic.com/media/c851b6_47055d02397140d69fa73c01b9621723~mv2.png/v1/fill/w_1083,h_650,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_47055d02397140d69fa73c01b9621723~mv2.png',
    'https://static.wixstatic.com/media/c851b6_7ecc7c4dfcc5412f8e0586b2fd54e3f2~mv2.png/v1/fill/w_1193,h_718,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_7ecc7c4dfcc5412f8e0586b2fd54e3f2~mv2.png',
    'https://static.wixstatic.com/media/c851b6_f185150677c944b0b145f4c4e0a70b91~mv2.png/v1/fill/w_1139,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_f185150677c944b0b145f4c4e0a70b91~mv2.png',
    'https://static.wixstatic.com/media/c851b6_bf1a056c313142f681764204908db804~mv2.png/v1/fill/w_1141,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_bf1a056c313142f681764204908db804~mv2.png',
    'https://static.wixstatic.com/media/c851b6_580595a2a9fc458ab7e29cd7b48675fe~mv2.png/v1/fill/w_1139,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_580595a2a9fc458ab7e29cd7b48675fe~mv2.png',
    'https://static.wixstatic.com/media/c851b6_7e5600e79f0343d084cdc3b979e1c85f~mv2.png/v1/fill/w_1318,h_791,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_7e5600e79f0343d084cdc3b979e1c85f~mv2.png',
    'https://static.wixstatic.com/media/c851b6_915355f7cad44c2da73bf46693aab2c3~mv2.png/v1/fill/w_1196,h_718,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_915355f7cad44c2da73bf46693aab2c3~mv2.png',
    'https://static.wixstatic.com/media/c851b6_afddead233f640b280e54a442a90bfe9~mv2.png/v1/fill/w_1534,h_717,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_afddead233f640b280e54a442a90bfe9~mv2.png',
    'https://static.wixstatic.com/media/c851b6_604a31defdee4540bb0795a3d67dc584~mv2.png/v1/fill/w_1195,h_718,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_604a31defdee4540bb0795a3d67dc584~mv2.png',
    'https://static.wixstatic.com/media/c851b6_9bbe568e665a4dde85fbb3196b0bd43e~mv2.png/v1/fill/w_1198,h_718,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_9bbe568e665a4dde85fbb3196b0bd43e~mv2.png',
    'https://static.wixstatic.com/media/c851b6_01ccce7950ac4cd391510ef532ad34d1~mv2.png/v1/fill/w_1139,h_684,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/c851b6_01ccce7950ac4cd391510ef532ad34d1~mv2.png',
    'https://static.wixstatic.com/media/c851b6_c7a625c16e60416db11d9b921da00075~mv2.jpg/v1/fill/w_1107,h_684,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_c7a625c16e60416db11d9b921da00075~mv2.jpg',
  ];
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: textList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 110.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                return libraryWidget(textList[index], imagesList[index]);
              },
            )
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
          // CustomSizeBox(10.h),
          // Image(
          //   image: AssetImage(image),
          //   height: 70.h,
          //   width: 140.w,
          // ),
          CustomSizeBox(4.h),
          FadeInImage(
            height: 70.h,
            width: 140.w,
            image: NetworkImage(image),
            placeholder: const AssetImage('assets/images/placeHolder.png'),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/placeHolder.png',
                  fit: BoxFit.fitWidth);
            },
            fit: BoxFit.fitWidth,
          ),
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
            InteractiveViewer(
                maxScale: 5.0,
                minScale: 0.01,
                boundaryMargin: EdgeInsets.all(8.sp),
                child: Image(image: NetworkImage(image))),
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
