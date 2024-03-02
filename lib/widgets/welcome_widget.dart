import 'package:flutter/material.dart';

Widget welcomeWidget() =>const  Row(
  children: [
    Text(
      "Hello,",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    ),
    Text(
      " Sara Rose",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
  ],
);