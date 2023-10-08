import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/Ui/authentication/view/login_screen.dart';
import 'package:exg/Ui/splash_screen/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CreateSplashScreen extends StatefulWidget {

  @override
  State<CreateSplashScreen> createState() => _CreateSplashScreenState();
}

class _CreateSplashScreenState extends State<CreateSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (context, provider, snapshot) {
          return const SplashScreen(
          );
        }));
  }
}
