import 'dart:convert';

import 'package:exg/global/helper/api_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../global/helper/custom_snackbar.dart';

class AuthProvider extends ChangeNotifier {
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
          pass,requestBody,
          context);
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(res.toString());
      }
    } catch (e) {
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }

  // reggiter user
  registerFunction(String email, String pass, BuildContext context) async {
    String requestBody = jsonEncode({
    "identity": {
        "identifiers": [
            {
                "email": email.toString()
            }
        ]
    },
    "inputs": {
        "password": pass.toString()
    },
     "captcha_tokens": 
            [{
              "InvisibleRecaptcha": 
                ""
}]
});
    try {
      Response response = await Apifunctions().postRequest(
         'https://www.exg-learning.com/_api/iam/authentication/v1/register',
          email,
          pass, requestBody,
          context);
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(res.toString());
      }
    } catch (e) {
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }


   // reggiter user
  signUpFunction(String email, String pass, BuildContext context) async {
    String requestBody = jsonEncode({
  "email": email.toString(),
  "password": pass.toString(),
  "profilePrivacyStatus": "PUBLIC",
  "contactInfo": {
    "customFields": []
  },
  "defaultFlow": true
}
);
    try {
      Response response = await Apifunctions().postRequest(
         'https://www.exg-learning.com/_api/wix-sm-webapp/v1/auth/signup',
          email,
          pass, requestBody,
          context);
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(res.toString());
      }
      print( "Response: "+ res.toString());
    } catch (e) {
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }
}
