import 'package:flutter/material.dart';
import '../../../domains/constans/app_prefs.dart';
import '../home/home_screen.dart';
import '../sign in/sign_in_screen.dart';

class SplashController {
  static checklogin(BuildContext context) async {
    bool islogin = await AppPrefs().getBool();
    if (islogin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }
}
