import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Ui/splash_screen/view/splash_view.dart';
import 'global/app_startup/app_startup.dart';

Future<void> main() async  {
    WidgetsFlutterBinding.ensureInitialized();
  await AppStartupConfiguration.doConfigurations();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
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
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
