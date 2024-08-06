import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/character_screen.dart';
import 'package:trial_task_01/widgets/progress_app_bar.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  int _selectedValue = 0;
  final List goals = [
    {
      "title": "Boosted Confidence",
      "subtitle": "Feel more confident in my abilities",
      "goal": "assets/images/goal1.png",
    },
    {
      "title": "Increased Discipline",
      "subtitle": "Develop a stronger sense of commitment",
      "goal": "assets/images/goal2.png",
    },
    {
      "title": "Enhanced Positivity",
      "subtitle": "Cultivate a more positive mindset",
      "goal": "assets/images/goal3.png",
    },
    {
      "title": "Improved Focus",
      "subtitle": "Sharpen my mental clarity & focus",
      "goal": "assets/images/goal4.png",
    },
    {
      "title": "Greater Self Awareness",
      "subtitle": "Discover my strengths & potential",
      "goal": "assets/images/goal5.png",
    },
  ];
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: progressAppBar(context, .5, false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "What do you want to achieve in the next 30 days?",
                style: font28w600(color: black),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Radio<int>(
                          activeColor: black,
                          value: index + 1,
                          groupValue: _selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: dividerGrey),
                            borderRadius: BorderRadius.circular(6)),
                        title: Text(
                          goals[index]['title'],
                          style: font16w500(),
                        ),
                        subtitle: Text(
                          goals[index]['subtitle'],
                          style: font12w400(),
                        ),
                        trailing: Image.asset(
                          goals[index]['goal'],
                          height: 24,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: goals.length),
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
                        "goal": goals[_selectedValue]['title']
                      }).then((value) => removeNextScreen(
                              context, const CharacterScreen()));
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
      ),
    );
  }
}
