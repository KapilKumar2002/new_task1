import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/auth/login_screen.dart';
import 'package:trial_task_01/views/exercises/endurablast_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int day = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(104),
          child: Container(
            height: 120,
            color: black,
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Day 1 of 30",
                      style: font24w700(color: white),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Day 1 -Day 10",
              style: font20w700(),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/images/fit2.png",
                          height: 33,
                        ),
                      ),
                      Text(
                        "ENDURANCE BLAST",
                        style: font20w700(),
                      ),
                    ]),
                    Text(
                      "The Endurance Blast workout boosts strength, flexibility, and stamina with a mix of stretches and exercises targeting key muscles and joints.",
                      style: font12w400(),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "61 kcal",
                            style: font12w400(),
                          ),
                        ),
                        const Text("|"),
                        const SizedBox(
                          width: 7,
                        ),
                        const Icon(
                          Icons.circle,
                          size: 3,
                          color: grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "10 minutes",
                            style: font12w400(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: width(
                          context), // Use MediaQuery to get the screen width
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.circle,
                                size: width(context) / 35,
                                color: index + 1 == day ? black : grey,
                              ),
                              Text(
                                (index + 1).toString(),
                                style: font16w500(),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: SizedBox(
                                width: width(context) / 50,
                                child: Divider(
                                    // Define a width for the separator
                                    )),
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        nextScreen(context, const EnduraScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          minimumSize: Size(width(context), 39)),
                      child: Text(
                        "View Workout",
                        style: font14w500(color: white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
