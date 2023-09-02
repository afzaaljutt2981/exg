import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/helper/custom_sized_box.dart';
import '../../../global/utils/app_text_styles.dart';

class SeeFullImage extends StatefulWidget {
  SeeFullImage({required this.image, required this.text, super.key});
  String image;
  String text;

  @override
  State<SeeFullImage> createState() => _SeeFullImageState();
}

class _SeeFullImageState extends State<SeeFullImage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage(widget.image)),
                CustomSizeBox(10.h),
                Text(
                  widget.text,
                  style: AppTextStyle.ralewayFont(
                      fontSize: 10.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
