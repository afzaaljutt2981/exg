import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../global/helper/custom_snackbar.dart';
import '../../../global/utils/app_colors.dart';
import '../../../global/utils/app_text_styles.dart';
import '../../drawer/view/drawer_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({required this.screenType, super.key});
  String screenType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _email.clear();
    _pass.clear();
    super.initState();
  }

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    bool processLogin = context.watch<AuthProvider>().loginProcess;
    return Scaffold(
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
      endDrawer: const MyDrawer(),
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
              child: textField(_email, false, 'Email', 0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
              child: textField(_pass, hidePassword, 'Password', 1),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            context.read<AuthProvider>().setLoginProcess(true);
                            await context.read<AuthProvider>().loginFunction(
                                _email.text, _pass.text, context);
                            // _email.clear();
                            // _pass.clear();
                          } else {
                            context.read<AuthProvider>().setLoginProcess(true);
                            await context.read<AuthProvider>().registerFunction(
                                _email.text, _pass.text, context);
                            // ignore: use_build_context_synchronously
                            await context.read<AuthProvider>().signUpFunction(
                                _email.text, _pass.text, context);
                            // _email.clear();
                            // _pass.clear();
                          }
                        }
                      },
                      child: (processLogin == false)
                          ? Text(
                              widget.screenType.toString(),
                              style: AppTextStyle.ralewayFont(
                                  color: Colors.white,
                                  fontSize: (widget.screenType == "Log in")
                                      ? 15.sp
                                      : 12.sp),
                            )
                          : SpinKitCircle(color: Colors.white, size: 15.sp),
                    ),
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
    );
  }

  Widget textField(TextEditingController textController, bool isObsecure,
      String hintText, int index) {
    return TextField(
      textInputAction: index == 0 ? TextInputAction.next : TextInputAction.done,
      cursorColor: Colors.white,
      obscureText: isObsecure,
      controller: textController,
      style: AppTextStyle.ralewayFont(color: Colors.white, fontSize: 15.sp),
      decoration: InputDecoration(
        suffixIcon: index == 0
            ? null
            : GestureDetector(
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                child: hidePassword
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      )),
        fillColor: AppColors.blueColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.only(
            left: 10.w,
            top: index == 1 ? 0.h : 14.h,
            right: index == 1 ? 10.w : 0.h),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
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
}
