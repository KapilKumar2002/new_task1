import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_task_01/views/bottom_navigation.dart';
import 'package:trial_task_01/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance.currentUser;
  void getScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isLoggedIn = await prefs.getBool('isLoggedIn');
    if (isLoggedIn == true) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationScreen()),
              (route) => false));
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
              (route) => false));
    }
  }

  @override
  void initState() {
    super.initState();
    getScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 62,
              width: 97,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "FITFREAK",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
