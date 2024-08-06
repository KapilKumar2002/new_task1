import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/auth/login_screen.dart';
import 'package:trial_task_01/widgets/continue_with_google_button.dart';
import 'package:trial_task_01/widgets/custom_text_field.dart';
import 'package:trial_task_01/widgets/option_divider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                    "Create an Account",
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
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        nextScreen(context, const LoginScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: black,
                        minimumSize: Size(width(context), 39)),
                    child: Text(
                      "Sign Up",
                      style: font14w500(color: white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      nextScreen(context, const LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: font14w400(color: black),
                        ),
                        Text(
                          "Login",
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
