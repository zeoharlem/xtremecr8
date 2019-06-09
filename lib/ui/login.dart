import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'fab_bottom_app_bar.dart';
import 'tab_bar_animation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
//      letterSpacing: 1.0,
      fontSize: 13.0,
      color: Colors.black38);

  TextStyle buttonStyle = TextStyle(
      fontFamily: 'BalooTamma',
//      fontWeight: FontWeight.w100,
      letterSpacing: 1.0,
      fontSize: 14.0,
      color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Enter your email address",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        hintText: "Type your password",
        prefixIcon: Icon(Icons.lock_outline),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TabBarAnimation())),
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text(
          "SIGN IN",
          textAlign: TextAlign.center,
          style: buttonStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final facebook = Expanded(child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xff1a237e),
        child: MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text(
            "Facebook",
            textAlign: TextAlign.center,
            style: buttonStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      )
    );

    final register = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xff1a237e),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text(
            "REGISTER NOW",
            textAlign: TextAlign.center,
            style: buttonStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            color: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "XTREMECARDZ",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ubuntu"),
                  ),
                  Text(
                    "CREATIVE INNOVATIONS",
                    style: TextStyle(
                        fontSize: 10.0,
                        letterSpacing: 2.0,
                        color: Colors.teal.shade100,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans"),
                  ),
                  SizedBox(height: 35.0),
                  emailField,
                  SizedBox(
                    height: 7.0,
                  ),
                  passwordField,
                  SizedBox(
                    height: 10.0,
                  ),
                  loginButton,
                  SizedBox(
                    height: 8.0,
                  ),
                  register,
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(
                        fontSize: 10.0,
                        letterSpacing: 2.0,
                        color: Colors.teal.shade100,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
