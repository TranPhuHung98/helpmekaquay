import 'package:flutter/material.dart';
import 'package:test_ij/register/register_screen.dart';
import 'dart:async';
import 'package:test_ij/splash/home_screen.dart';
import 'package:test_ij/welcome/intro_screen.dart';
import 'package:test_ij/splash/splash_screen.dart';
import 'package:test_ij/login/login_screen.dart';
import 'package:test_ij/fogotpass/fogot_password.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/WelcomeScreen': (BuildContext context) => new WelcomeScreen(),
        '/HomeScreen': (BuildContext context) => new HomeScreen(),
        '/ForgotPass': (BuildContext context) => new ForgotPass(),
        '/Register': (BuildContext context) => new Register(),
      },
//      home: LoginScreen(),
    );
  }
}

