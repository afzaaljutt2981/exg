import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController textController;
  bool isObsecure;
  TextInputType type;
  String hintText;
  int numOfLines;
  void Function(String?)? onChanged;
  TextFieldWidget(
      {Key? key,
      this.onChanged,
      required this.hintText,
      required this.numOfLines,
      required this.isObsecure,
      required this.textController,
      required this.type})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: super.widget.type,
      obscureText: super.widget.isObsecure,
      controller: super.widget.textController,
      maxLines: super.widget.numOfLines,
      onChanged: super.widget.onChanged,
      style: AppTextStyle.ralewayFont(color: Colors.white),
      decoration: InputDecoration(
        fillColor: AppColors.blueColor,
        filled: true,
        hintText: super.widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        // fillColor: CColors.fillColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }
}
