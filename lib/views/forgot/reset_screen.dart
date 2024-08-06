import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';
import 'package:trial_task_01/views/forgot/confirm_screen.dart';
import 'package:trial_task_01/widgets/custom_text_field.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              goBack(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: SizedBox(
          height: 10,
          width: 204, // Adjust the height as needed
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(9),
            value: 0.5, // 50% progress
            backgroundColor: lightGray,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password",
                style: font28w600(color: black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Please enter your email to reset the password",
                style: font14w400(),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _key,
                  child: Column(
                    children: [
                      CustomTextField(
                          labelText: "Email",
                          hintText: "Enter your email",
                          obscure: false,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Your email is incorrect';
                            }
                            return null;
                          }),
                    ],
                  )),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(
                            email: emailController.text.toString())
                        .then((value) =>
                            nextScreen(context, const ConfirmScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    minimumSize: Size(width(context), 39)),
                child: Text(
                  "Reset Password",
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
