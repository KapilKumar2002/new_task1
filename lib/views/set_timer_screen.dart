import 'package:flutter/material.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/bottom_navigation.dart';
import 'package:trial_task_01/widgets/progress_app_bar.dart';

class SetTimerScreen extends StatefulWidget {
  const SetTimerScreen({super.key});

  @override
  State<SetTimerScreen> createState() => _SetTimerScreenState();
}

class _SetTimerScreenState extends State<SetTimerScreen> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: progressAppBar(context, 1, false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "At what time would you like to workout?",
              style: font28w600(color: black),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  TimePickerSpinner(
                    locale: const Locale('en', ''),
                    time: dateTime,
                    is24HourMode: false,
                    isShowSeconds: false,
                    itemHeight: 80,
                    normalTextStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600, color: grey),
                    highlightedTextStyle:
                        const TextStyle(fontSize: 20, color: black),
                    onTimeChange: (time) {
                      setState(() {
                        dateTime = time;
                      });
                    },
                  ),
                  Text(
                    "People who set reminders are 30% more likely to workout regularly. ",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400, color: grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  nextScreen(context, const BottomNavigationScreen());
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
