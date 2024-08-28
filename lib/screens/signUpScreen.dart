import 'package:aamaa/component/btnComp.dart';
import 'package:aamaa/component/textFieldComp.dart';
import 'package:aamaa/component/txtComp.dart';
import 'package:aamaa/screens/loginScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../uiColor/uiColor.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emilController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  late bool isObscured= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                TxtComp(
                  text: "Create new account",
                  isBold: true,
                  size: 16,
                ),
          
                SizedBox(height: 10,),
                TextfieldComp(
                  label: "Full Name",
                  hint: "fullname",
                  controller: _fullnameController,
                ),
          
                SizedBox(height: 10,),
                TextfieldComp(
                  controller: _emilController,
                  label: "Email",
                  hint: "email",
                ),
          
                SizedBox(height: 10,),
                TextfieldComp(
                  controller: _phoneController,
                  label: "Phone",
                  hint: "Phone",
                ),
          
                SizedBox(height: 10,),
                SizedBox(
                  height: 47,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: isObscured,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility,color: Colors.black45,),
                        onPressed: () {
                          setState(() {
                            isObscured = !isObscured;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.3)
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: bgColor.withOpacity(0.2)),
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
          
                SizedBox(height: 10,),
                TextfieldComp(
                  controller: _confirmController,
                  label: "Confirm",
                  hint: "Password",
                  hide: true,
                ),
                
                SizedBox(height: 30,),
                Btncomp(text: "Create New Account",
                textcolor: Colors.white,
                width: 400,
                onclick: (){
                  print("Clicked on create new account");
                },
                backgroundColor: bgColor,),
          
                SizedBox(height: 20,),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text:"Already have an account? ",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
          
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: bgColor,
                        fontWeight: FontWeight.bold
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap=(){
                        print("Click on login");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                        }
                    )
                  ]
                )),
          
                SizedBox(height: 30,),
                TxtComp(text: "By creating an account. you accept Amaa's",color: Colors.black,),
                RichText(text: TextSpan(
                  text: "Terms of Services and Privacy Policy",
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold
                  )
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
