import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/services/auth_services.dart';
import 'package:trial_task_01/services/database_services.dart';
import 'package:trial_task_01/views/welcome_screen.dart';

continueWithGoogle(BuildContext context) {
  final AuthServices authServices = AuthServices();
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: ElevatedButton(
        onPressed: () {
          authServices.signInWithGoogle().then((value) async {
            // await userCollection.doc(value.user!.uid).set({
            //   "email": value.user!.email,
            //   "username": value.user!.displayName,
            // });
            DatabaseServices(value.user!.uid)
                .saveData(value.user!.email.toString());
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);

            nextScreen(context, const WelcomeScreen());
          }).onError((error, stackTrace) => toast(error.toString()));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Continue with Google",
              style: font14w500(),
            )
          ],
        )),
  );
}
