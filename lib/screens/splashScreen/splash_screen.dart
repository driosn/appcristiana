import 'package:app_cristiana/screens/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage())
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("assets/images/bautista.jpeg"),
          width: 170.0,
          height: 170.0,
        )
      )
    );
  }
}