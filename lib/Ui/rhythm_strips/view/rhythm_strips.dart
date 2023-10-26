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
  void dispose() {
    super.dispose();
  }

  List textList = [
    '1st Degree Heart Block',
    "2nd Degree Mobitz type I heart Block",
    '2nd Degree Mobitz type II heart block',
    "2nd Degree Mobitz II Heart Block",
    '3rd Degree Heart Block',
    'Atrial Fibrillation (Pre-excited)',
    'Atrial Ectopic Beats',
    'Asystole',
    'Agonal Rhythm',
    'Effect of adenosine',
    'Atrial Fibrillation',
    'Atrial Fibrillation with Rapid Ventricular Conduction',
    'Atrial Fibrillation with slow ventricular response',
    'Atrial Flutter With Variable AV conduction',
    'Atrial Flutter 3 to 1 conduction',
    'Atrial flutter 2 to 1 conduction',
    'Atrial bigeminy',
    'Atrial Tachycardia (Focal)',
    'Atrial Tachycardia (Multifocal)',
    'Junctional Rhythm',
    'P-mitrale',
    'P-pulmonale',
    'Sinus Bradycardia',
    'Sinus Arrhythmia',
    'Sinus rhythm',
    'Supraventricular tachycardia',
    'Ventricular Bigeminy',
    'Ventricular Trigeminy',
    'Ventricular Tachycardia with fusion beats and capture beats',
    'Ventricular Tachycadia (Monomorphic)',
    'Ventricular Tachycardia (Polymorphic)',
    'Ventricular Fibrillation',
    'R on T phenomonon',
    'Wolff-Parkinson-White Syndrome'
  ];
  List imagesList = [
    "https://static.wixstatic.com/media/c851b6_0f74228be5e647ecb804063bda6b3be2~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_0f74228be5e647ecb804063bda6b3be2~mv2.png",
    "https://static.wixstatic.com/media/c851b6_386597eb9779482e86fe02cfe9b8726b~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_386597eb9779482e86fe02cfe9b8726b~mv2.png",
    "https://static.wixstatic.com/media/c851b6_e110646d2a6448448ac6b98d7d916473~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_e110646d2a6448448ac6b98d7d916473~mv2.png",
    "https://static.wixstatic.com/media/c851b6_9a1b9ad8b3a548b1a152d7f05f455b1b~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_9a1b9ad8b3a548b1a152d7f05f455b1b~mv2.png",
    'https://static.wixstatic.com/media/c851b6_dde0c5934fec4fa287871c59454ddb6e~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_dde0c5934fec4fa287871c59454ddb6e~mv2.png',
    'https://static.wixstatic.com/media/c851b6_d7b12452ba8d4ba38b1b189415f3b308~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_d7b12452ba8d4ba38b1b189415f3b308~mv2.png',
    'https://static.wixstatic.com/media/c851b6_ae958db13bc0406890e932ef95ef0639~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_ae958db13bc0406890e932ef95ef0639~mv2.png',
    'https://static.wixstatic.com/media/c851b6_dbdc27d3901c42d3919837686b96dddf~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_dbdc27d3901c42d3919837686b96dddf~mv2.png',
    'https://static.wixstatic.com/media/c851b6_a2a3409752ae417a99588f5ed104bc63~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_a2a3409752ae417a99588f5ed104bc63~mv2.png',
    'https://static.wixstatic.com/media/c851b6_f7f7bc2afa0247e8881f273e92cd62c6~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_f7f7bc2afa0247e8881f273e92cd62c6~mv2.png',
    'https://static.wixstatic.com/media/c851b6_ec6b236541a6495d8074c4f60a8d0789~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_ec6b236541a6495d8074c4f60a8d0789~mv2.png',
    'https://static.wixstatic.com/media/c851b6_388b38aa69f44cb6ab47fa9bf2a5d625~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_388b38aa69f44cb6ab47fa9bf2a5d625~mv2.png',
    'https://static.wixstatic.com/media/c851b6_899141b3293245e198e57ac2039d7bf6~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_899141b3293245e198e57ac2039d7bf6~mv2.png',
    'https://static.wixstatic.com/media/c851b6_279d1215e19249dbb9d7f47119d67f8e~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_279d1215e19249dbb9d7f47119d67f8e~mv2.png',
    'https://static.wixstatic.com/media/c851b6_c395c2e1875c4539a05601e192e510c5~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_c395c2e1875c4539a05601e192e510c5~mv2.png',
    'https://static.wixstatic.com/media/c851b6_9ab218c87248469283e99637b23173cc~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_9ab218c87248469283e99637b23173cc~mv2.png',
    'https://static.wixstatic.com/media/c851b6_65132ef5900f449e83afba1bddfe7e2e~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_65132ef5900f449e83afba1bddfe7e2e~mv2.png',
    'https://static.wixstatic.com/media/c851b6_8a900d9cde6d447aa3a6a18e8abf4e0b~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_8a900d9cde6d447aa3a6a18e8abf4e0b~mv2.png',
    'https://static.wixstatic.com/media/c851b6_4379f4ca5b424cd0a455fcce097ab8b6~mv2.jpg/v1/fill/w_704,h_244,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/c851b6_4379f4ca5b424cd0a455fcce097ab8b6~mv2.jpg',
    'https://static.wixstatic.com/media/c851b6_c27d9710eeca458da042aaf014d46685~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_c27d9710eeca458da042aaf014d46685~mv2.png',
    'https://static.wixstatic.com/media/c851b6_d803f5f67053429ba3700e0490e12d6c~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_d803f5f67053429ba3700e0490e12d6c~mv2.png',
    'https://static.wixstatic.com/media/c851b6_3f9a5a2ed6e24c56bc281206675fe681~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_3f9a5a2ed6e24c56bc281206675fe681~mv2.png',
    'https://static.wixstatic.com/media/c851b6_2e8c1f62903144a0b7281410bb6bc9ec~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_2e8c1f62903144a0b7281410bb6bc9ec~mv2.png',
    'https://static.wixstatic.com/media/c851b6_0f9f8be0dfa54d90ac0c9137b592794e~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_0f9f8be0dfa54d90ac0c9137b592794e~mv2.png',
    'https://static.wixstatic.com/media/c851b6_2a3cc1aaba06422aa440f4a3426bf8f2~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_2a3cc1aaba06422aa440f4a3426bf8f2~mv2.png',
    'https://static.wixstatic.com/media/c851b6_2c04e1bb71524f3e9cda97f9f30237f9~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_2c04e1bb71524f3e9cda97f9f30237f9~mv2.png',
    'https://static.wixstatic.com/media/c851b6_230f77406a4c45059d825999a8359a21~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_230f77406a4c45059d825999a8359a21~mv2.png',
    'https://static.wixstatic.com/media/c851b6_54ef0bb11d3e47ad972ceb6758a759cc~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_54ef0bb11d3e47ad972ceb6758a759cc~mv2.png',
    'https://static.wixstatic.com/media/c851b6_2cdb2a51b0674492897d7d9d06ebbd9b~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_2cdb2a51b0674492897d7d9d06ebbd9b~mv2.png',
    'https://static.wixstatic.com/media/c851b6_ea4381a88797453e8683aaeceb31601d~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_ea4381a88797453e8683aaeceb31601d~mv2.png',
    'https://static.wixstatic.com/media/c851b6_f7acc2788fa34d489bc6e13d34a4a2f7~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_f7acc2788fa34d489bc6e13d34a4a2f7~mv2.png',
    'https://static.wixstatic.com/media/c851b6_5936d3774b044d5bb9ee97bee92cccf8~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_5936d3774b044d5bb9ee97bee92cccf8~mv2.png',
    'https://static.wixstatic.com/media/c851b6_c458dd949f164bc68dd19d651fd8abff~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_c458dd949f164bc68dd19d651fd8abff~mv2.png',
    'https://static.wixstatic.com/media/c851b6_4bbb0b8cc4e74f4bbc93fbdceca57bf4~mv2.png/v1/fill/w_704,h_244,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c851b6_4bbb0b8cc4e74f4bbc93fbdceca57bf4~mv2.png'
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
                return rhythmWidget(textList[index], imagesList[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget rhythmWidget(
    String text,
    String image,
  ) {
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
          CustomSizeBox(4.h),
          FadeInImage(
            height: 50.h,
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
      insetPadding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
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
                child: Image(
                  image: NetworkImage(image),
                )),
            CustomSizeBox(10.h),
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
