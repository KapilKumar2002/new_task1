import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';

class CommonAppBar extends StatefulWidget {
  final String title;
  const CommonAppBar({super.key, required this.title});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      foregroundColor: white,
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      title: Text(widget.title),
    );
  }
}
