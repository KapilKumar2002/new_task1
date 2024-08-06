import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/exercises/starting_in_screen.dart';
import 'package:trial_task_01/widgets/common_app_bar.dart';

class EnduraScreen extends StatefulWidget {
  const EnduraScreen({super.key});

  @override
  State<EnduraScreen> createState() => _EnduraScreenState();
}

class _EnduraScreenState extends State<EnduraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar(title: "Endurance Blast"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Card(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/endura.png",
                    height: 400,
                    width: width(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "The Endurance Blast workout boosts strength, flexibility, and stamina with a mix of stretches and exercises targeting key muscles and joints.",
                style: font12w400(height: 1.75),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 3,
                    color: grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "61 kcal",
                      style: font14w400(),
                    ),
                  ),
                  const Icon(
                    Icons.circle,
                    size: 3,
                    color: grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "10 minutes",
                      style: font14w400(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  nextScreen(context, const StartingInScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    minimumSize: Size(width(context), 39)),
                child: Text(
                  "Start Workout",
                  style: font14w500(color: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
