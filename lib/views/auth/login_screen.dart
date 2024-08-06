import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/auth/signup_screen.dart';
import 'package:trial_task_01/views/forgot/reset_screen.dart';
import 'package:trial_task_01/views/welcome_screen.dart';
import 'package:trial_task_01/widgets/continue_with_google_button.dart';
import 'package:trial_task_01/widgets/custom_text_field.dart';
import 'package:trial_task_01/widgets/option_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _key = GlobalKey<FormState>();
  bool loading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 323,
              width: width(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: imageFilter(),
                fit: BoxFit.fill,
                image: const AssetImage("assets/images/onboard6.png"),
              )),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, top: 52),
                    child: Image.asset(
                      "assets/images/llogo.png",
                      height: 26,
                      width: 40,
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                children: [
                  Text(
                    "Log In",
                    style: font32w600(),
                  ),
                  continueWithGoogle(context),
                  optionDivider(),
                  Form(
                      key: _key,
                      child: Column(
                        children: [
                          CustomTextField(
                              labelText: "Email",
                              hintText: "Enter your email",
                              obscure: false,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Your email is incorrect';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextField(
                            labelText: "Password",
                            hintText: "Enter your password",
                            obscure: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (!RegExp(
                                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$')
                                  .hasMatch(value)) {
                                return 'Your password is incorrect';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () {
                        nextScreen(context, const ResetScreen());
                      },
                      child: Text(
                        "Forgot Password",
                        style: font10w600(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        await auth
                            .signInWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString())
                            .then((value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          setState(() {
                            loading = false;
                          });
                          removeNextScreen(context, const WelcomeScreen());
                        }).onError((error, stackTrace) {
                          setState(() {
                            loading = false;
                          });
                          toast(error.toString());
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: black,
                        minimumSize: Size(width(context), 39)),
                    child: Text(
                      "Log In",
                      style: font14w500(color: white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      removeNextScreen(context, const SignUpScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: font14w400(color: black),
                        ),
                        Text(
                          "Sign Up",
                          style: font14w500(underline: true),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
