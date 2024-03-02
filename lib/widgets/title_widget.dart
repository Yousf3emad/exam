import 'package:flutter/material.dart';

Widget titleWidget({
  required String txt,
  FontWeight fontWeight = FontWeight.w600,
  double fontSize = 18,
}) => Text(
  txt,
  style: TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
  ),
);