import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Apifunctions {
  late Response response;
  Future postRequest(
      String url, String email, String pass, BuildContext context) async {
    try {
      var apiLink = Uri.parse(url);
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

      response = await post(apiLink,
          headers: {
            'Authorization':
                'FdpDIIRS-CDewbCbjWpAM7j8U-EHJPhmu4eYCt_vRqw.eyJpbnN0YW5jZUlkIjoiOTkxN2IwZjQtYjdiMi00ZjZkLTliMjYtOGI1NWFjZTAxYTI0IiwiYXBwRGVmSWQiOiIxNGNjNTliYy1mMGI3LTE1YjgtZTFjNy04OWNlNDFkMGUwYzkiLCJtZXRhU2l0ZUlkIjoiOWVmMGFlZWQtZDMxYi00Yzc0LThkMGUtNzk4MTM5YmU1NTk2Iiwic2lnbkRhdGUiOiIyMDIzLTA5LTA3VDA0OjQ0OjA4Ljk0OVoiLCJ1aWQiOiI0NmJhZmRhZC1lODdjLTQ2OTctOTQxZi0wYmMzNjc0MmNiMGYiLCJkZW1vTW9kZSI6ZmFsc2UsImFpZCI6ImMyMTI1OTEyLTliYmUtNGFlYi1iMzM3LThjODljN2NhYjU1YSIsImJpVG9rZW4iOiIwN2U3MWUxOS02NGE5LTAzMTktMTYyOC1mMmQ0OTU1ZTRmYjIiLCJzaXRlT3duZXJJZCI6ImM4NTFiNjNlLTVjMjQtNGYzMC04YmNjLThlZWFlOWZmM2ExNyIsImV4cGlyYXRpb25EYXRlIjoiMjAyMy0wOS0wN1QwODo0NDowOC45NDlaIiwiaGFzVXNlclJvbGUiOmZhbHNlfQ',
            'Content-Type': 'application/json',
          },
          body: requestBody); 
    } on SocketException catch (_) {}
    return response;
  }
}
