
import 'dart:async';

import 'package:aamaa/screens/loginSingScreen.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginsingscreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: bgColor,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: ClipRRect(
                child: Image.asset('assets/images/logo.png',width: 150,height: 150,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
