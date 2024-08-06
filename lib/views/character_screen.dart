import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/set_timer_screen.dart';
import 'package:trial_task_01/widgets/progress_app_bar.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int _selectedValue = 0;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: progressAppBar(context, .75, false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Who would you like to workout with?",
              style: font28w600(color: black),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerGrey),
                              borderRadius: BorderRadius.circular(10)),
                          height: 230,
                          child: Stack(
                            children: [
                              Radio<int>(
                                activeColor: black,
                                value: 1,
                                groupValue: _selectedValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Image.asset(
                                        "assets/images/female.png")),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Mia",
                            style: font16w500(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerGrey),
                              borderRadius: BorderRadius.circular(10)),
                          height: 230,
                          child: Stack(
                            children: [
                              Radio<int>(
                                activeColor: black,
                                value: 2,
                                groupValue: _selectedValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: AlignmentDirectional.center,
                                    child:
                                        Image.asset("assets/images/male.png")),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Mike",
                            style: font16w500(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () async {
                  if (_selectedValue > 0) {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(user!.uid)
                        .update({
                      "buddy": _selectedValue == 0 ? "Female" : "Male"
                    }).then((value) =>
                            removeNextScreen(context, const SetTimerScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    minimumSize: Size(width(context), 39)),
                child: Text(
                  "Continue",
                  style: font14w500(color: white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
