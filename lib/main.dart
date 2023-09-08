import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Ui/splash_screen/view/splash_view.dart';

Future<void> main() async  {
  // await SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
