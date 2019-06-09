import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      seconds: 3
    ), (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Login()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Image.asset(
            "assets/images/logo.png", width: 100.0, color: Colors.white,
        ),
      ),
    );
  }
}
