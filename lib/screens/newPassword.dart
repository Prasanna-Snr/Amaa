import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../component/btnComp.dart';
import '../component/textFieldComp.dart';
import '../component/txtComp.dart';
import '../uiColor/uiColor.dart';
import 'loginScreen.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: 10,),
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
                    TxtComp(text: "Enter New Password",
                      isBold: true,
                      size: 15,),
          
                    SizedBox(height: 15,),
                    TxtComp(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"),
          
                    SizedBox(height: 15,),
                    TextfieldComp(
                      controller: _newPasswordController,
                      hint: "New password",
                      label: "New password",
                    ),
                    
                    SizedBox(height: 15,),
                    TextfieldComp(
                      controller: _confirmPasswordController,
                      label: "Confirm",
                      hint: "Confirm",
                    ),
          
                    SizedBox(height: 15,),
                    Btncomp(text: "Submit",
                      width: 400,
                      textcolor: Colors.white,
                      backgroundColor: bgColor,
                      onclick: (){
                        print("click submit");
                      },),
          
                    SizedBox(height: 25,),
          
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
