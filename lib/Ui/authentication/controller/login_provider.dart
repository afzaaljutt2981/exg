import 'dart:convert';

import 'package:exg/global/helper/api_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../global/helper/custom_snackbar.dart';

class AuthProvider extends ChangeNotifier {
  loginFunction(String email, String pass, BuildContext context) async {
    try {
      Response response = await Apifunctions().postRequest(
          'https://www.exg-learning.com/_api/iam/authentication/v1/login',
          email,
          pass,
          context);
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(res.toString());
      }
    } catch (e) {
      CustomSnackBar(false).showInSnackBar(e.toString(), context);
    }
  }
}
