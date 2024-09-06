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
  final _formKey = GlobalKey<FormState>(); // Key to validate form
  bool isObscured = true; // Controls visibility of password

  // Regular expression for password validation
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
                      },
                      child: const Text(
                        "Skip",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 150, height: 150),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey, // Form key for validation
                      child: Column(
                        children: [
                          const TxtComp(
                            text: "Enter New Password",
                            isBold: true,
                            size: 15,
                          ),
                          const SizedBox(height: 15),
                          const TxtComp(
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                          ),
                          const SizedBox(height: 15),
                          // New Password Input
                          SizedBox(
                            child: TextFormField(
                              controller: _newPasswordController,
                              obscureText: isObscured,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                label: const Text("Password"),
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility, color: Colors.black45),
                                  onPressed: () {
                                    setState(() {
                                      isObscured = !isObscured; // Toggle visibility
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: bgColor.withOpacity(0.2)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                                ),
                                fillColor: Colors.white70.withOpacity(0.5),
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter password";
                                } else if (!passwordRegex.hasMatch(value)) {
                                  return "Password must be at least 8 characters long,include\nan uppercase letter, a lowercase letter, and a number.";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Confirm Password Input
                          TextfieldComp(
                            controller: _confirmPasswordController,
                            hint: "Confirm",
                            label: "Confirm",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Confirm password";
                              } else if (value != _newPasswordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          // Submit Button
                          Btncomp(
                            text: "Submit",
                            width: 400,
                            textcolor: Colors.white,
                            backgroundColor: bgColor,
                            onclick: () {
                              if (_formKey.currentState!.validate()) {
                                // Only prints if form is valid
                                print("New password: ${_newPasswordController.text}");
                              }
                              print("Click submit");
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
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
