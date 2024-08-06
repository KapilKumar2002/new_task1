import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/goal_screen.dart';
import 'package:trial_task_01/widgets/progress_app_bar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List stages = [
    {
      "stage": 1,
      "duration": "1-10",
      "type": "Endurance Blast Workout",
      "time": "10",
      "logo": "assets/images/fit1.png"
    },
    {
      "stage": 2,
      "duration": "11-20",
      "type": "Aerobic Inferno Workout",
      "time": "15",
      "logo": "assets/images/fit2.png"
    },
    {
      "stage": 3,
      "duration": "21-30",
      "type": "Strength Circuit Workout",
      "time": "20",
      "logo": "assets/images/fit3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: progressAppBar(context, .25, false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to FitFreak!",
              style: font28w600(color: black),
            ),
            Text(
              "Join our 30-day challenge to build strength, endurance, and confidence.",
              style: font14w400(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: dividerGrey),
                          borderRadius: BorderRadius.circular(6)),
                      title: Row(
                        children: [
                          Text(
                            "Stage ${stages[index]["stage"]}: ",
                            style: font16w500(),
                          ),
                          Text(
                            "Days ${stages[index]["duration"]}",
                            style: font16w500(),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 4,
                            color: grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              stages[index]["type"],
                              style: font12w400(),
                            ),
                          ),
                          const Icon(
                            Icons.circle,
                            size: 4,
                            color: grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "${stages[index]["time"]} minutes",
                              style: font12w400(),
                            ),
                          )
                        ],
                      ),
                      trailing: Image.asset(
                        stages[index]["logo"],
                        height: 24,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: stages.length),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  nextScreen(context, const GoalScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    minimumSize: Size(width(context), 39)),
                child: Text(
                  "Start Your Journey",
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
