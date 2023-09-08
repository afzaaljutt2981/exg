import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSnackBar extends StatelessWidget {
  bool okOperation = true;
  CustomSnackBar(this.okOperation, {super.key});

  void showInSnackBar(String value, BuildContext conx) {
    ScaffoldMessenger.of(conx).removeCurrentSnackBar();
    var shortestSide = MediaQuery.of(conx).size.shortestSide;
    // ignore: non_constant_identifier_names
    var CustomSnackBar = SnackBar(
        backgroundColor:
            okOperation == true ? AppColors.blueColor : AppColors.redColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: shortestSide > 600
                    ? MediaQuery.of(conx).size.width - 48
                    : 300,
                child: Text(value,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.ralewayFont(
                      fontSize: shortestSide > 600 ? 10.sp : 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ))),
          ],
        ));
    ScaffoldMessenger.of(conx).showSnackBar(
      CustomSnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
