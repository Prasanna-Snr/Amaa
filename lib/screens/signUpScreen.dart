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
  final TextEditingController _emailController = TextEditingController();  // Corrected typo
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  late bool isObscured = true;
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
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            width: double.infinity,
            child: Form(  // Added Form widget
              key: _formKey,  // Using form key
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your full name";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10,),
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

                  SizedBox(height: 10,),
                  TextfieldComp(
                    controller: _phoneController,
                    label: "Phone",
                    hint: "Phone",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your phone number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 10,),
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

                  SizedBox(height: 10,),
                  TextfieldComp(
                    controller: _confirmController,
                    label: "Confirm",
                    hint: "Password",
                    hide: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 30,),
                  Btncomp(
                    text: "Create New Account",
                    textcolor: Colors.white,
                    width: 400,
                    onclick: () {
                      if (_formKey.currentState!.validate()) {
                        print("Full name: ${_fullnameController.text} Email: ${_emailController.text} Phone: ${_passwordController.text}, Password: ${_passwordController.text}");
                      }
                    },
                    backgroundColor: bgColor,
                  ),

                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
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
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
                              }
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),
                  TxtComp(text: "By creating an account, you accept Amaa's", color: Colors.black,),
                  RichText(
                    text: TextSpan(
                        text: "Terms of Services and Privacy Policy",
                        style: TextStyle(
                            color: bgColor,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
