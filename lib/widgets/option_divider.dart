import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';

Widget optionDivider() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
            child: Divider(
          color: dividerGrey,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "or",
            style: font14w400(),
          ),
        ),
        const Expanded(
            child: Divider(
          color: dividerGrey,
        ))
      ],
    ),
  );
}
