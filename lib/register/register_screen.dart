import 'package:flutter/material.dart';
import 'package:test_ij/welcome/my_navigator.dart';

class Register extends StatefulWidget{
  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {

    final email = TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Nhập email đăng kí',
            contentPadding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0)
            )
        )
    );

    final password = TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Nhập mật khẩu',
          contentPadding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final confirm = TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Nhập lại mật khẩu',
          contentPadding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final registerButton = Padding(
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
          child: Text('Đăng kí tài khoản', style: TextStyle(color: Colors.white,fontSize: 20.0),),
          onPressed: (){

          },
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 10.0),
            registerButton
          ],
        ),
      ),
    );
  }

}