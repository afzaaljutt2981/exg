import 'package:exg/Ui/authentication/controller/login_provider.dart';
import 'package:exg/Ui/authentication/view/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CreateLoginScreen extends StatefulWidget {
   CreateLoginScreen({ required this.screenType, super.key});
  @override
  String screenType;
  State<CreateLoginScreen> createState() => _CreateLoginScreenState();
}

class _CreateLoginScreenState extends State<CreateLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (context, provider, snapshot) {
          return LoginScreen(screenType: widget.screenType,);
        }));
  }
}
