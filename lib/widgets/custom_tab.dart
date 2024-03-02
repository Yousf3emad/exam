import 'package:flutter/material.dart';

Widget customTab({required String txt}) => Tab(
  child: Text(
    txt,
    style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color(0xff363F72)),
  ),
);