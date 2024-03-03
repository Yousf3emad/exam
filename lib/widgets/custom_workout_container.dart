import 'package:flutter/material.dart';

Widget customWorkoutContainer({
  required BuildContext context,
  bool isImage = false,
  required String titleTxt,
  required String subTitleTxt,
  IconData? icon,
   String? img,

}) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
  width: size.width*0.25,
  height: 70,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isImage? Image.asset(img!) : Icon(icon,color: Colors.purple,),
          Text(titleTxt),
        ],
      ),
      const SizedBox(height: 6,),
      Text(subTitleTxt,textAlign: TextAlign.center,),
    ],
  ),
);
}