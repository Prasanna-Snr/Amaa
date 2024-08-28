import 'package:aamaa/component/btnComp.dart';
import 'package:aamaa/screens/loginScreen.dart';
import 'package:aamaa/screens/signUpScreen.dart';
import 'package:aamaa/slider/slide1.dart';
import 'package:aamaa/slider/slide2.dart';
import 'package:aamaa/slider/slide3.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Loginsingscreen extends StatefulWidget {
  const Loginsingscreen({super.key});

  @override
  State<Loginsingscreen> createState() => _LoginsingscreenState();
}

class _LoginsingscreenState extends State<Loginsingscreen> {

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 80,),
            SizedBox(height: 450,
            child: PageView(
              controller: _controller,
              children: [
                Slide1(),
                Slide2(),
                Slide3(),
              ],
            ),
            ),
            SmoothPageIndicator(controller: _controller,
                count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: bgColor,
              dotColor: Colors.grey.withOpacity(0.5),
              dotHeight: 10
            ),),
            SizedBox(height: 33,),
            Btncomp(text:"Create an account",
            textcolor: Colors.white,
            width: 300,
            onclick: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              print("create an account clicked ");
            },
            backgroundColor: bgColor,),

            SizedBox(height: 30,),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have account?",
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: " Log in",
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap= (){
                    print("Tap on login");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                    }
                )
              ]
            ))
          ],
        )
      ),
    );
  }
}
