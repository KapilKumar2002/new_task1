import 'package:flutter/material.dart';

height(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

width(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

nextScreen(BuildContext context, Widget screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

goBack(BuildContext context) {
  return Navigator.pop(context);
}

ColorFilter imageFilter() {
  return const ColorFilter.mode(
    Colors.black54,
    BlendMode.darken,
  );
}

TextStyle font28w600({Color? color}) {
  return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: color ?? white,
      fontFamily: "Roboto");
}

TextStyle font10w600() {
  return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: black,
      decoration: TextDecoration.underline,
      fontFamily: "Roboto");
}

TextStyle font12w400() {
  return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: grey,
      fontFamily: "Roboto");
}

TextStyle font10w500({Color? color}) {
  return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: color ?? black,
      fontFamily: "Roboto");
}

TextStyle font32w600() {
  return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: black,
      fontFamily: "Roboto");
}

TextStyle font14w500({Color? color, bool? underline}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color ?? black,
    fontFamily: "Roboto",
    decoration: underline == true ? TextDecoration.underline : null,
  );
}

TextStyle font16w500() {
  return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: black,
      fontFamily: "Roboto");
}

TextStyle font24w700({Color? color}) {
  return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color ?? black,
      fontFamily: "Roboto");
}

TextStyle font20w700({Color? color}) {
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? black,
      fontFamily: "Roboto");
}

TextStyle font14w400({Color? color, bool? underline}) {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      height: 1.5,
      color: color ?? grey,
      fontFamily: "Roboto");
}

//colors

const Color white = Colors.white;
const Color black = Color(0xFF0A0D19);
const Color dividerGrey = Color(0xFFB6B6B6);
const Color grey = Color(0xFF737373);
const Color transparent = Colors.transparent;
const Color lightGray = Color(0xFFF1F1F1);
const Color errorColor = Color(0xFFFF3D00);
