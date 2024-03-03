import 'package:flutter/material.dart';

Widget titleWidget({
  required String txt,
  FontWeight fontWeight = FontWeight.w600,
  double fontSize = 18,
  Color? txtColor,
}) => Text(
  txt,
  style: TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: txtColor,
  ),
);