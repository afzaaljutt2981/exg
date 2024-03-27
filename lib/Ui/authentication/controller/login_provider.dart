import 'dart:convert';

import 'package:exg/Ui/authentication/model/model.dart';
import 'package:exg/Ui/authentication/view/verify_user.dart';
import 'package:exg/Ui/home/view/home_view.dart';
import 'package:exg/Ui/splash_screen/model/toker_model.dart';
import 'package:exg/global/helper/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../global/helper/custom_snackbar.dart';
import '../../../global/utils/global_hive.dart';
import '../view/create_login_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool loginProcess = false;

  Future getJwtToken(BuildContext context) async {
    Response response = await Apifunctions().getRequest(
        'https://www.exg-learning.com/_api/v2/dynamicmodel', context);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      TokenModel.tokenJwt = res['apps']['22bef345-3c5b-4c18-b782-74d4085112ff']
              ['instance']
          .toString();
    } else {}
    notifyListeners();
  }

  setLoginProcess(bool value) {
    loginProcess = value;
    notifyListeners();
  }

  loginFunction(String email, String pass, BuildContext context) async {
    String requestBody = jsonEncode({
      "identifier": {
        "email": email.toString(),
      },
      "inputs": {
        "password": pass.toString(),
      },
      "captcha_tokens": [
        {"InvisibleRecaptcha": ""}
      ]
    });
    try {
      Response response = await Apifunctions().postRequest(
          'https://www.exg-learning.com/_api/iam/authentication/v1/login',
          email,
          pass,
          requestBody,
          context);

      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        preferences.put('startup_session', 'true');
        final protectedPages =
            res['additionalData']['protectedPages']['mapValue']['value'];

        int count = 0;

        for (var key in protectedPages.keys) {
          count++;
        }

        preferences.put('countLength', count);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeView(showUSerGuide: true,)),
            (route) => false);

        setLoginProcess(false);
      } else if (response.statusCode == 404) {
        setLoginProcess(false);
        // ignore: use_build_context_synchronously
        CustomSnackBar(false)
            .showInSnackBar("User not found".toString(), context);
      } else if (response.statusCode == 401) {
        setLoginProcess(false);
        // ignore: use_build_context_synchronously
        CustomSnackBar(false)
            .showInSnackBar("Wrong Password".toString(), context);
      } else if (response.statusCode == 500) {
        if (res['message'] == 'Unimplemented feature requested') {
          String bodyResponse = jsonEncode({
            "email": email.toString(),
            "password": pass.toString(),
          });

          // ignore: use_build_context_synchronously
          Response response = await Apifunctions().postRequest(
              'https://www.exg-learning.com/_api/wix-sm-webapp/v1/auth/login',
              email,
              pass,
              bodyResponse,
              context);
          var res = jsonDecode(response.body);
          if (response.statusCode == 428) {
            if (res['message'] == 'Email verification required.') {
              setLoginProcess(false);
              LoginModel.verificationId =
                  res['details']['applicationError']['data']['verificationId'];
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyUserScreen(
                            email: email,
                            pass: pass,
                          )));
            }
          } else if (response.statusCode == 403) {
            setLoginProcess(false);
            // ignore: use_build_context_synchronously
            CustomSnackBar(false).showInSnackBar(
                "Email is already exist, please Login".toString(), context);
          } else {
            setLoginProcess(false);
            // ignore: use_build_context_synchronously
            CustomSnackBar(false)
                .showInSnackBar(res['message'].toString(), context);
          }
        }
      }
    } catch (e) {
      setLoginProcess(false);
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }

  // reggiter user
  registerFunction(String email, String pass, BuildContext context) async {
    String requestBody = jsonEncode({
      "identity": {
        "identifiers": [
          {"email": email.toString()}
        ]
      },
      "inputs": {"password": pass.toString()},
      "captcha_tokens": [
        {"InvisibleRecaptcha": ""}
      ]
    });
    try {
      Response response = await Apifunctions().postRequest(
          'https://www.exg-learning.com/_api/iam/authentication/v1/register',
          email,
          pass,
          requestBody,
          context);
      //  var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setLoginProcess(false);
      }
    } catch (e) {
      setLoginProcess(false);
      //  CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }

  // reggiter user
  signUpFunction(String email, String pass, BuildContext context) async {
    String requestBody = jsonEncode({
      "email": email.toString(),
      "password": pass.toString(),
      "profilePrivacyStatus": "PUBLIC",
      "contactInfo": {"customFields": []},
      "defaultFlow": true
    });
    try {
      Response response = await Apifunctions().postRequest(
          'https://www.exg-learning.com/_api/wix-sm-webapp/v1/auth/signup',
          email,
          pass,
          requestBody,
          context);
      var res = jsonDecode(response.body);
      if (response.statusCode == 428) {
        if (res['message'] == 'Email verification required.') {
          setLoginProcess(false);
          LoginModel.verificationId =
              res['details']['applicationError']['data']['verificationId'];
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifyUserScreen(
                        email: email,
                        pass: pass,
                      )));
        } else {
          // ignore: use_build_context_synchronously
          CustomSnackBar(false)
              .showInSnackBar(res['message'].toString(), context);
        }
      } else if (response.statusCode == 403) {
        setLoginProcess(false);
        // ignore: use_build_context_synchronously
        CustomSnackBar(false).showInSnackBar(
            "Email is already exist, please Login".toString(), context);
      }
    } catch (e) {
      setLoginProcess(false);
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }

  // reggiter user
  verifyUserOtp(
      String email, String pass, String otp, BuildContext context) async {
    String requestBody = jsonEncode({
      "email": email.toString(),
      "password": pass.toString(),
      "emailVerification": {
        "verificationId": LoginModel.verificationId.toString(),
        "otp": otp
      }
    });
    Response response = await Apifunctions().postRequest(
        'https://www.exg-learning.com/_api/wix-sm-webapp/v1/auth/login',
        email,
        pass,
        requestBody,
        context);
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      CustomSnackBar(true)
          .showInSnackBar("Account created, Please Login.".toString(), context);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => CreateLoginScreen(
                screenType: 'Log in',
              )));
    } else if (response.statusCode == 401) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      CustomSnackBar(false)
          .showInSnackBar("Please enter correct OTP".toString(), context);
    }
  }
}
