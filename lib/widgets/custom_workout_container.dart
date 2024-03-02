import 'package:flutter/material.dart';

Widget customWorkoutContainer({
  bool isImage = false,
  required String titleTxt,
  required String subTitleTxt,
  IconData? icon,
   String? img,

}) => SizedBox(
  width: 100,
  height: 70,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isImage? Image.asset(img!) : Icon(icon,color: Colors.purple,),
          Text(titleTxt),
        ],
      ),
      const SizedBox(height: 6,),
      Text(subTitleTxt),
    ],
  ),
);