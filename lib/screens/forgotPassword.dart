import 'package:aamaa/component/btnComp.dart';
import 'package:aamaa/component/textFieldComp.dart';
import 'package:aamaa/component/txtComp.dart';
import 'package:aamaa/screens/loginScreen.dart';
import 'package:aamaa/screens/otpScreen.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                   },
                   child: Text("Skip",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15,
                         color: Colors.grey
                     ),),
                 ),
               ],
             ),

              SizedBox(height: 80,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Image.asset('assets/images/logo.png',width: 150,height: 150,),

                  SizedBox(height: 50,),
                  TxtComp(text: "Forget Password?",
                  isBold: true,
                  size: 15,),

                  SizedBox(height: 15,),
                  TxtComp(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"),

                  SizedBox(height: 15,),
                  TextfieldComp(
                    controller: _phoneController,
                    hint: "Phone number",
                  ),
                  
                  SizedBox(height: 15,),
                  Btncomp(text: "Recover Password",
                  width: 400,
                  textcolor: Colors.white,
                  backgroundColor: bgColor,
                  onclick: (){
                    print("click on recover password");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                  },),

                  SizedBox(height: 25,),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black
                        )
                      ),

                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){
                          print("click on sign in");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                          }
                      )
                    ]
                  ))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
