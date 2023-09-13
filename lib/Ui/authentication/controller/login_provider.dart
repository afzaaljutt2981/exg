import 'dart:convert';

import 'package:exg/Ui/authentication/model/model.dart';
import 'package:exg/Ui/authentication/view/verify_user.dart';
import 'package:exg/global/helper/api_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../global/helper/custom_snackbar.dart';

class AuthProvider extends ChangeNotifier {
  bool loginProcess = false;

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
        print(res.toString());
        setLoginProcess(false);
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
      var res = jsonDecode(response.body);
      // print(response.statusCode.toString());
      if (response.statusCode == 200) {
        // print(res.toString());
        setLoginProcess(false);
      }
      // print("register: " + res.toString());
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
                  builder: (context) => VerifyUserScreen(email: email, pass: pass,)));
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
      var res = jsonDecode(response.body);
      print(response.statusCode);
      print(res.toString());
      // print(response.statusCode.toString());
      if (response.statusCode == 200) {
        // print(res.toString());
      
      }
      // print("register: " + res.toString());
   
  }
}
