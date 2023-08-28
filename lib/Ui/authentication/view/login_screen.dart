import 'package:exg/global/helper/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(hintText: "email"),
            ),
            TextFormField(
              controller: _pass,
              decoration: InputDecoration(hintText: "email"),
            ),
            CustomSizeBox(30),
            ElevatedButton(
                onPressed: () {
                  postRequest(context);
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }

  late Response response;
  postRequest(BuildContext context) async {
    try {
      var apiLink = Uri.parse(
          'https://www.exg-learning.com/_api/iam/authentication/v1/login');
      response = await post(apiLink,
          // headers: {
          //   'Authorization': 'Bearer $userToken',
          //   'Content-Type': 'application/json',
          //   "Accept": "*/*",
          //   'traceid': traceid,
          // },
          body: {
            "identifier": {"email": "afzaalwaheed420@ggmail.com"},
            "inputs": {"password": "Afzal123*"},
            "captcha_tokens": [
              {
                "InvisibleRecaptcha":
                    "03ADUVZwBMm2kk25yAr8W5v_wjkfKncOR63Sr_OUhEHaw81q_Zj9pGAkEFVjToioCsl4JXD1fmZUPHSUc2tQrGPIcbvkJ4ISn73ap55eSAkJhcVxvXNRPsjhnicRXhdiEJPEdL6K6Si4fscDa1necI3KGwRYpIFPY6lS4IVUPjv3WYG3kg1vwbjaA9KaNR6uoLSvnhBS_r_EdqXiz8UCuOd7FcSHIdwfF1WmjBWSeNvkA1ruNu4cJvqpreV4RphlMAeXnC1jA2WHYc5IQKik5FFBOvYmNjtUiyMJlL7DjmM4OPhLL2fX8NlztJkRdUNkS2oC3PpxKtWh-Da6e09RlnsStOrP3GLiA10tbl2W-3uIhkubMB_fsy4UeK5q4UcS334QQRKaexpO7ruHr0rDUnTM1m2NOf1qw8Dh9sKcJbNfrkKkhjh-PD1hNAMsmsUorIGHFGSnf30mhR9x5OwR1FuQoKweKRFLOzC_NeAPO7L16d7g3J6JjnsmelnNnVDQPX6p-fVHTX9f2h6tVYGCXbwzJ7H2J2pVkBMTpJB4P5j0hQ42-5EWLf-jkKMxJtqmXDQ9FW5HPMrAgZsfrAEUbxeERmnqNPxt-fUsNF8A4NrNBvnDfMZR-zhQaCMJL6d2rNOlRcneUjULp3hbvBgy3yOlXon0qnCJiUpsb-h5-TuclP8cZqk8xVKWhZUcrHJPJfO9brJucg2oBgd9RKgggunTZ3onUdgoWUkEqi5WehhIpvn8CSnJDATdTUOXy_sYvd9c-VtFebj9f1gB9FqLhdXbQwHSDCUuQjO-NexRJkAWQuvt9yLufX3FvaVZ761Iyh0tGXVjKFJ-sm_fMyCCv2Oznd_fXtPEI1mA9_rP2mizdf9urcVCW_vTw6L6mkNlaDApRgCOL1FQS33zoEz0mMAyg-4EkfYyDyp1D04Qq_da30HSt2PzQlBQznczKHNIPZDdPicqMUS9FXqcTd3KxynE6vxzow7kg6oxkb0H0erluMSgbd8zcGPgubsZ53VD88nACPEov4PvbcGWS18tcC9WXyS516FPIlw5zTODSmKXFfqLyOJVV99nheyaXyOtJCxebuwUJAUoOgh4a6KK34h3vAcgIbRt2_QUBt1q9Z59bTUGohdABWCcNAhiW9mbZCWNt-IKqIjEHDJc0Koe7HPuojfQjZdtxZFzSX6_5GtpM63Qq-_34-tm6YiureYVP6ZDZFt-klpqzhGn1yZDigcY9bvuisL9rZFKzFlOHRrROQR8OjaMpF1lGGwPCBBPBK0UBbvLKHRYftsE0qis0jxzbQGwxfiBuQyuv32hWeY_tKbFll4TUU3yeFCf49115VrnAQ3Ud_vIL9jwy-FFBsvf9uGN0BjuV0G3GfMQn7pBaVdEPw7nt5nNL8KZkxf5yxLh8ujULpNJSq6Lir-yQbUHOzZF4atSRUmXW8_LpCLYISmCyDYt8l14KCLxl-zEJch4YqC10Qu_5HDK0zAUG0-XgFQb5CR09MvmkLM4L7zDbtxTL7Wjz-mvfRmylc5ELPEOwHZWuKYesBowu-OXwVkGqzK9iX2CuOuKGJThNiP6HcCBuzKNQc_EHUG_Ki8LZJUMLUgJQL7Le8qrr8DpRQCv_h6hIIqxMEUA"
              }
            ]
          });
      print(response.toString());
    } catch (e) {
      print("error: " + e.toString());
    }
  }
}
