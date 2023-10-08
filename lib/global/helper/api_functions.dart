import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../Ui/splash_screen/model/toker_model.dart';

class Apifunctions {
  late Response response;
  Future postRequest(String url, String email, String pass, var body,
      BuildContext context) async {
    try {
      var apiLink = Uri.parse(url);

      response = await post(apiLink,
          headers: {
            'Authorization':
                TokenModel.tokenJwt.toString(),},
          body: body);
    } on SocketException catch (_) {}
    return response;
  }


    getRequest(String url, BuildContext context) async {
    try {
      var apiLink = Uri.parse(url.toString());
      response = await get(apiLink, headers: {
      
        'Content-Type': 'application/json',
        "Accept": "*/*",
     
      });
    } on SocketException catch (_) {
    
    }
    return response;
  }
}
