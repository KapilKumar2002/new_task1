import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              "assets/images/user.png",
              height: 140,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Name",
              style: font20w700(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Email Id",
              style: font14w500(color: grey),
            )
          ],
        ),
      ),
    );
  }
}
