import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/HomeScreen");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/LoginScreen");
  }

  static void goToWelcome(BuildContext context) {
    Navigator.pushNamed(context, "/WelcomeScreen");
  }

  static void goToFogotPass(BuildContext context) {
    Navigator.pushNamed(context, "/ForgotPass");
  }

  static void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, "/Register");
  }

}