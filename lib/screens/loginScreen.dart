import 'package:aamaa/component/textFieldComp.dart';
import 'package:aamaa/screens/forgotPassword.dart';
import 'package:aamaa/screens/signUpScreen.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(height: 150,),
              Image.asset('assets/images/logo.png',width: 150,height: 150,),
              SizedBox(height: 30,),

              TextfieldComp(
                controller: _emailController,
                hint: "Email",
                label: "Email",
              ),

              SizedBox(height:15,),

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

              SizedBox(height: 50,),
              InkWell(
                child:Text("Forgot Password?",
                style: TextStyle(
                  color: bgColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                  print("Tap on forgot password");
                },
              ),

              SizedBox(height: 20,),
              RichText(text: TextSpan(
                children:[
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: " Sign up",
                    style: TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap=(){
                      print("Tap on Sign up");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      }
                  )
                ]
              ))

            ],
          ),
        ),
      ),
    );
  }
}
