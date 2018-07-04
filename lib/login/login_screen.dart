import 'package:flutter/material.dart';
import 'package:test_ij/welcome/my_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print('User name: ${user.displayName}');
    MyNavigator.goToHome(context);
    return user;
  }

//  void startFBlogin() async {
//    var fblogin = new FacebookLogin();
//    var result = await fblogin.logInWithReadPermissions(['email', 'public_profile']);
//    switch(result.status){
//      case FacebookLoginStatus.loggedIn:
//        FirebaseAuth.instance.signInWithFacebook(accessToken: result.accessToken.token);
//        break;
//      case FacebookLoginStatus.error:
//        print("FB sign in failed");break;
//      case FacebookLoginStatus.cancelledByUser:
//        print('FB sign in cancelled by user');break;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo-stdiohue-1.png'),
      ),
    );

    final email = TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final password = TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.blue,
        elevation: 5.0,
        child: MaterialButton(
          color: Colors.blue,
          minWidth: 200.0,
          height: 42.0,
          highlightColor: Colors.grey,
          child: Text(
            'ĐĂNG NHẬP',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {
            MyNavigator.goToHome(context);
          },
        ),
      ),
    );

    final register = FlatButton(
      child: Text(
        'Chưa có tài khoản?',
        style: TextStyle(color: Colors.black26),
      ),
      onPressed: () {
        MyNavigator.goToRegister(context);
      },
    );

    final forgotPass = FlatButton(
      child: Text(
        'Quên mật khẩu?',
        style: TextStyle(color: Colors.black26),
      ),
      onPressed: () {
        MyNavigator.goToFogotPass(context);
      },
    );

//    final Image abc = Image.asset('images/android.png');

    final loginOtherWays = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          child: Image.asset('images/facebook.png'),
          onPressed: () {
//            startFBlogin();
          },
        ),
        FlatButton(
          child: Image.asset('images/twitter.png'),
          onPressed: () {},
        ),
        FlatButton(
          child: Image.asset('images/google.png'),
          onPressed: () {
            _signIn()
                .then((FirebaseUser user) => print(user))
                .catchError((e) => print(e));
          },
        ),
      ],
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 60.0),
                  logo,
                  SizedBox(height: 20.0),
                  email,
                  SizedBox(height: 10.0),
                  password,
                  SizedBox(height: 20.0),
                  loginButton,
                  SizedBox(height: 10.0),
                  loginOtherWays,
                  SizedBox(height: 10.0),
                  register,
                  forgotPass
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
