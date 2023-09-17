import 'dart:async';

import 'package:exg/Ui/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../global/utils/global_hive.dart';
import '../../authentication/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      if (preferences.get('startup_session') != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const HomeView())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const LoginView())));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // var shortestSide = MediaQuery.of(context).size.shortestSide;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Image(
            image: AssetImage('assets/images/splash_screen.png'),
          ),
        ),
      ),
    );
  }
}
