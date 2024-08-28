import 'package:aamaa/component/btnComp.dart';
import 'package:aamaa/component/txtComp.dart';
import 'package:aamaa/screens/newPassword.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'loginScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
int code =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  TxtComp(text: "Get your Code",
                  size: 15,
                  isBold: true,),

                  SizedBox(height: 15,),
                  TxtComp(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"),

                  SizedBox(height: 15,),
                  Pinput(
                    length: 6,
                    onChanged: (value){
                      setState(() {
                        code = int.tryParse(value)?? 0;
                      });
                    },
                    onCompleted: (value){
                      if(value != '123456'){
                        print("Wrong otp");
                      }else{
                        print('$value, complete');
                      }
                    },

                    onSubmitted: (value){
                      if(value!='123456'){
                        print('wrong code');
                      }else{
                        print('$value, submit');
                      }
                    },
                  ),

                  SizedBox(height: 20,),
                  Btncomp(text: "Verify and proceed",
                  width: 400,
                  textcolor: Colors.white,
                  backgroundColor: bgColor,
                  onclick: (){
                    print("click on verify and proceed");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Newpassword()));
                  },)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
