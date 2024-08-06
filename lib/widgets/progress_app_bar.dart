import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';

progressAppBar(BuildContext context, double value, bool leading) {
  return AppBar(
    automaticallyImplyLeading: leading,
    elevation: 0,
    leading: leading
        ? IconButton(
            onPressed: () {
              goBack(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded))
        : null,
    title: SizedBox(
      height: 10,
      width: 204, // Adjust the height as needed
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(9),
        value: value, // 50% progress
        backgroundColor: lightGray,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
    centerTitle: true,
  );
}
