import 'package:flutter/material.dart';
import 'package:trial_task_01/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.obscure,
      required this.controller,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    // TODO: implement initState
    isObscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: font16w500(),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorStyle: font10w500(color: errorColor),
            hintStyle: font14w400(),
            suffixIconColor: black,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: dividerGrey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: dividerGrey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: dividerGrey)),
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined))
                : null,
          ),
        )
      ],
    );
  }
}
