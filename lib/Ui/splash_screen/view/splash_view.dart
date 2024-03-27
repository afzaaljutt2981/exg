import 'dart:async';
import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/Ui/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    context.read<AuthProvider>().getJwtToken(context);
    Future.delayed(const Duration(seconds: 1));
    if (preferences.get('startup_session') != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const HomeView(showUSerGuide: true,))));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const LoginView(showUSerGuide: true,))));
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
