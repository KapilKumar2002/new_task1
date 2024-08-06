import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/constants/data.dart';
import 'package:trial_task_01/widgets/common_app_bar.dart';

class StartingInScreen extends StatefulWidget {
  const StartingInScreen({super.key});

  @override
  State<StartingInScreen> createState() => _StartingInScreenState();
}

class _StartingInScreenState extends State<StartingInScreen>
    with SingleTickerProviderStateMixin {
  int count = 10;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          backgroundColor: black,
          foregroundColor: white,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          title: Column(
            children: [
              Text(
                "1 of 11",
                style: font16w500(color: white),
              ),
              Text(
                "High Knees March",
                style: font20w700(color: white),
              )
            ],
          ),
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: height(context),
        minHeight: 150,
        panel: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Upcoming Exercises",
                style: font16w600(),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          width: width(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: dividerGrey),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      height: 60,
                                      width: 77,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                            FemaleData[index]['image']),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    FemaleData[index]['title'],
                                    style: font14w500(),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.info_outline))
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: FemaleData.length),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    // onTap: () {
                    //   var ticker = _controller.forward();
                    //   ticker.whenComplete(() => _controller.reset());
                    // },
                    child: Center(
                      child: CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        backgroundColor: lightGray,
                        radius: height(context) * .2,
                        lineWidth: 8,
                        percent: (count - 1) / 10,
                        reverse: true,
                        center: Lottie.asset(
                          "assets/Female/High Knees March.json",
                          controller: _controller,
                        ),
                        progressColor: darkGray,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Starting In",
                  style: font22w500(color: black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: black,
                      child: Image.asset(
                        "assets/images/speaker.png",
                        height: 23,
                      ),
                    ),
                    Text(
                      "10",
                      style: font80w600(),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: black,
                      child: Image.asset(
                        "assets/images/skip-next.png",
                        height: 40,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
