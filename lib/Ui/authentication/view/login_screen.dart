import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/Ui/authentication/view/verify_user.dart';
import 'package:exg/global/extras/text_field.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../global/helper/custom_snackbar.dart';
import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({required this.screenType, super.key});
  String screenType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: const AssetImage('assets/images/splash_screen.png'),
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
              CustomSizeBox(45.h),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Text(
                  widget.screenType.toString(),
                  textAlign: TextAlign.start,
                  style: AppTextStyle.ralewayFont(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blueColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: TextFieldWidget(
                    hintText: 'Email',
                    numOfLines: 1,
                    isObsecure: false,
                    textController: _email,
                    type: TextInputType.emailAddress),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
                child: TextFieldWidget(
                    hintText: 'Password',
                    numOfLines: 1,
                    isObsecure: true,
                    textController: _pass,
                    type: TextInputType.text),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp)),
                      width: 80.w,
                      height: 35.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.redColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ))),
                          onPressed: () async {
                            bool isEmailValid = validateEmail(_email.text);
                            if (_email.text.isEmpty) {
                              CustomSnackBar(false).showInSnackBar(
                                  "Email field is empty! ", context);
                            } else if (_pass.text.isEmpty) {
                              CustomSnackBar(false).showInSnackBar(
                                  "Password field is Empty ", context);
                            } else if (isEmailValid == false) {
                              CustomSnackBar(false)
                                  .showInSnackBar('Invalid email!', context);
                            } else {
                              if (widget.screenType == "Log in") {
                                await context
                                    .read<AuthProvider>()
                                    .loginFunction(
                                        _email.text, _pass.text, context);
                              } else {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             VerifyUserScreen(email: _email.text,)));
                                 await context.read<AuthProvider>().registerFunction(
                                      _email.text, _pass.text, context);
                                // ignore: use_build_context_synchronously
                                await  context.read<AuthProvider>().signUpFunction(
                                      _email.text, _pass.text, context);
                              }
                            }
                          },
                          child: Text(
                            widget.screenType.toString(),
                            style: AppTextStyle.ralewayFont(
                                color: Colors.white,
                                fontSize: (widget.screenType == "Log in")
                                    ? 15.sp
                                    : 12.sp),
                          )),
                    )
                  ],
                ),
              ),
              CustomSizeBox(40.h),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const Image(
                    image: AssetImage('assets/images/character_heads.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // late Response response;
  // postRequest(BuildContext context) async {
  //   try {
  //     var apiLink = Uri.parse(
  //         'https://www.exg-learning.com/_api/iam/authentication/v1/login');
  //     response = await post(apiLink,
  //         // headers: {
  //         //   'Authorization': 'Bearer $userToken',
  //         //   'Content-Type': 'application/json',
  //         //   "Accept": "*/*",
  //         //   'traceid': traceid,
  //         // },
  //         body: {
  //           "identifier": {"email": "afzaalwaheed420@ggmail.com"},
  //           "inputs": {"password": "Afzal123*"},
  //           "captcha_tokens": [
  //             {
  //               "InvisibleRecaptcha":
  //                   "03ADUVZwBMm2kk25yAr8W5v_wjkfKncOR63Sr_OUhEHaw81q_Zj9pGAkEFVjToioCsl4JXD1fmZUPHSUc2tQrGPIcbvkJ4ISn73ap55eSAkJhcVxvXNRPsjhnicRXhdiEJPEdL6K6Si4fscDa1necI3KGwRYpIFPY6lS4IVUPjv3WYG3kg1vwbjaA9KaNR6uoLSvnhBS_r_EdqXiz8UCuOd7FcSHIdwfF1WmjBWSeNvkA1ruNu4cJvqpreV4RphlMAeXnC1jA2WHYc5IQKik5FFBOvYmNjtUiyMJlL7DjmM4OPhLL2fX8NlztJkRdUNkS2oC3PpxKtWh-Da6e09RlnsStOrP3GLiA10tbl2W-3uIhkubMB_fsy4UeK5q4UcS334QQRKaexpO7ruHr0rDUnTM1m2NOf1qw8Dh9sKcJbNfrkKkhjh-PD1hNAMsmsUorIGHFGSnf30mhR9x5OwR1FuQoKweKRFLOzC_NeAPO7L16d7g3J6JjnsmelnNnVDQPX6p-fVHTX9f2h6tVYGCXbwzJ7H2J2pVkBMTpJB4P5j0hQ42-5EWLf-jkKMxJtqmXDQ9FW5HPMrAgZsfrAEUbxeERmnqNPxt-fUsNF8A4NrNBvnDfMZR-zhQaCMJL6d2rNOlRcneUjULp3hbvBgy3yOlXon0qnCJiUpsb-h5-TuclP8cZqk8xVKWhZUcrHJPJfO9brJucg2oBgd9RKgggunTZ3onUdgoWUkEqi5WehhIpvn8CSnJDATdTUOXy_sYvd9c-VtFebj9f1gB9FqLhdXbQwHSDCUuQjO-NexRJkAWQuvt9yLufX3FvaVZ761Iyh0tGXVjKFJ-sm_fMyCCv2Oznd_fXtPEI1mA9_rP2mizdf9urcVCW_vTw6L6mkNlaDApRgCOL1FQS33zoEz0mMAyg-4EkfYyDyp1D04Qq_da30HSt2PzQlBQznczKHNIPZDdPicqMUS9FXqcTd3KxynE6vxzow7kg6oxkb0H0erluMSgbd8zcGPgubsZ53VD88nACPEov4PvbcGWS18tcC9WXyS516FPIlw5zTODSmKXFfqLyOJVV99nheyaXyOtJCxebuwUJAUoOgh4a6KK34h3vAcgIbRt2_QUBt1q9Z59bTUGohdABWCcNAhiW9mbZCWNt-IKqIjEHDJc0Koe7HPuojfQjZdtxZFzSX6_5GtpM63Qq-_34-tm6YiureYVP6ZDZFt-klpqzhGn1yZDigcY9bvuisL9rZFKzFlOHRrROQR8OjaMpF1lGGwPCBBPBK0UBbvLKHRYftsE0qis0jxzbQGwxfiBuQyuv32hWeY_tKbFll4TUU3yeFCf49115VrnAQ3Ud_vIL9jwy-FFBsvf9uGN0BjuV0G3GfMQn7pBaVdEPw7nt5nNL8KZkxf5yxLh8ujULpNJSq6Lir-yQbUHOzZF4atSRUmXW8_LpCLYISmCyDYt8l14KCLxl-zEJch4YqC10Qu_5HDK0zAUG0-XgFQb5CR09MvmkLM4L7zDbtxTL7Wjz-mvfRmylc5ELPEOwHZWuKYesBowu-OXwVkGqzK9iX2CuOuKGJThNiP6HcCBuzKNQc_EHUG_Ki8LZJUMLUgJQL7Le8qrr8DpRQCv_h6hIIqxMEUA"
  //             }
  //           ]
  //         });
  //     print(response.toString());
  //   } catch (e) {
  //     print("error: " + e.toString());
  //   }
  // }
}
