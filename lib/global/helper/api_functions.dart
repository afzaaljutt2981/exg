import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Apifunctions {
  late Response response;
  Future postRequest(
      String url, String email, String pass,var body, BuildContext context) async {
    try {
      var apiLink = Uri.parse(url);
     

      response = await post(apiLink,
          headers: {
            'Authorization':
                'U8WXDRH_iiPKMn3ZBACkDBVgOafbzcGljr6ABxN4LF4.eyJpbnN0YW5jZUlkIjoiOWVmMGFlZWQtZDMxYi00Yzc0LThkMGUtNzk4MTM5YmU1NTk2IiwiYXBwRGVmSWQiOiIyMmJlZjM0NS0zYzViLTRjMTgtYjc4Mi03NGQ0MDg1MTEyZmYiLCJtZXRhU2l0ZUlkIjoiOWVmMGFlZWQtZDMxYi00Yzc0LThkMGUtNzk4MTM5YmU1NTk2Iiwic2lnbkRhdGUiOiIyMDIzLTA5LTEyVDExOjIwOjEzLjE1NloiLCJkZW1vTW9kZSI6ZmFsc2UsImFpZCI6ImMyMTI1OTEyLTliYmUtNGFlYi1iMzM3LThjODljN2NhYjU1YSIsInNpdGVPd25lcklkIjoiYzg1MWI2M2UtNWMyNC00ZjMwLThiY2MtOGVlYWU5ZmYzYTE3In0'
          },
          body: body); 
    } on SocketException catch (_) {}
    return response;
  }
}
