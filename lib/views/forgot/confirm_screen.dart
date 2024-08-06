import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/auth/login_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              goBack(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: SizedBox(
          height: 10,
          width: 204, // Adjust the height as needed
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(9),
            value: 1, // 50% progress
            backgroundColor: lightGray,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password Reset",
              style: font28w600(color: black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Password reset link has been sent to your email address. Click confirm to continue.",
              style: font14w400(),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, const LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  minimumSize: Size(width(context), 39)),
              child: Text(
                "Confirm",
                style: font14w500(color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
