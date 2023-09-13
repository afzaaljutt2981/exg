import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:exg/global/utils/app_colors.dart';
import 'package:exg/global/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../global/helper/custom_snackbar.dart';

class VerifyUserScreen extends StatefulWidget {
  VerifyUserScreen({required this.email, required this.pass, super.key});
  String email;
  String pass;
  @override
  State<VerifyUserScreen> createState() => _VerifyUserScreenState();
}

class _VerifyUserScreenState extends State<VerifyUserScreen> {
  TextEditingController pinputConroller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
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
                        color: AppColors.redColor,
                      ),
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Icon(
                    Icons.navigate_before,
                    color: AppColors.redColor,
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
                      image:
                          const AssetImage('assets/images/splash_screen.png'),
                      height: 90.sp,
                    ),
                  ),
                  Center(
                    child: Text(
                      "UNDERGRADUATE ECG \nTEACHING",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.luloClean(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueColor),
                    ),
                  ),

                  CustomSizeBox(35.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                        "Please enter six digit verification code that we have sent to: ",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.ralewayFont(
                            fontSize: 12.sp, color: Colors.grey)),
                  ),
                  CustomSizeBox(5.h),
                  Center(
                    child: Text(widget.email.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.ralewayFont(
                            fontSize: 12.sp, color: Colors.black)),
                  ),
                  CustomSizeBox(25.h),
                  Center(
                    child: Pinput(
                      controller: pinputConroller,
                      focusNode: focusNode,
                      keyboardType: TextInputType.number,
                      length: 6,
                      onCompleted: (otp) async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        try {
                          context.read<AuthProvider>().verifyUserOtp(
                              widget.email.toString(),
                              widget.pass.toString(),
                              otp.toString(),
                              context);
                        } catch (e) {
                          Navigator.of(context).pop();

                          FocusScope.of(context).unfocus();

                        CustomSnackBar(false).showInSnackBar(e.toString(), context);
                        }
                      },
                    ),
                  ),
                  CustomSizeBox(20.h),

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Center(
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 100.w),
                  //       child: const Image(
                  //         image: AssetImage('assets/images/character_heads.png'),
                  //         width: double.infinity,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // )

                  Center(
                    child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "Didn't receive code? ",
                            style: AppTextStyle.ralewayFont(
                                fontSize: 12.sp, color: Colors.grey),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                  text: "Resend",
                                  style: AppTextStyle.luloClean(
                                      color: Colors.black54)),
                            ])),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget text(String text, {required Function onTap}) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: AppTextStyle.ralewayFont(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.blueColor),
        ),
      ),
    );
  }
}
