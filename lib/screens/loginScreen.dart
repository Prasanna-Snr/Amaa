import 'package:aamaa/component/btnComp.dart';
import 'package:aamaa/screens/forgotPassword.dart';
import 'package:aamaa/screens/signUpScreen.dart';
import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../component/textFieldComp.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscured = true;
  final _formKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Image.asset('assets/images/logo.png',width: 150,height: 150,),
                SizedBox(height: 30,),

                Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        // Text Field for Email
                        TextfieldComp(
                          controller: _emailController,  // Corrected controller
                          label: "Email",
                          hint: "email",
                          validator: (value) {
                            if (!emailRegex.hasMatch(value ?? "")) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),

                        // Password Field
                        SizedBox(
                          // height: 47,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0
                                )
                              ),
                              fillColor: Colors.white70.withOpacity(0.5),
                              filled: true,
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Enter password";
                              } else if (!passwordRegex.hasMatch(value)) {
                                return "Password must be at least 8 characters long and\n"
                                    "include an uppercase letter,a lowercase letter and \n"
                                    "a number.";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),

                        Btncomp(
                          text: "Login",
                          width: 400,
                          backgroundColor: bgColor,
                          textcolor: Colors.white,
                          onclick: (){
                            if(_formKey.currentState!.validate()){
                              print("Email ${_emailController.text}, Password ${_passwordController.text}");
                            }
                          },
                        ),
                      ],
                    )),

                SizedBox(height: 20,),

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
      ),
    );
  }
}
