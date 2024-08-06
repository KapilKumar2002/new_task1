import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/auth/login_screen.dart';
import 'package:trial_task_01/views/auth/signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: height(context),
          width: width(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: imageFilter(),
                  image: const AssetImage("assets/images/onboard6.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/llogo.png",
                  height: 25,
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Transform in 30 Days:", style: font28w600()),
                    Text("Your Fitness Journey Starts Here!",
                        style: font28w600()),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            nextScreen(context, const SignUpScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(39)),
                              minimumSize: const Size(124, 39)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: black),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            nextScreen(context, const LoginScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: transparent,
                              shape: RoundedRectangleBorder(
                                  side:
                                      const BorderSide(width: 1, color: white),
                                  borderRadius: BorderRadius.circular(39)),
                              minimumSize: const Size(124, 39)),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
