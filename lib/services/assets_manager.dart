

import 'package:flutter/material.dart';

class AssetsManager{
  static String cool = "assets/images/cool.png";
  static String happy = "assets/images/happy.png";
  static String love = "assets/images/love.png";
  static String sad = "assets/images/sad.png";

  static String banner1 = "assets/images/banners/banner1.png";
  static String careBanner_1 = "assets/images/banners/care_banner_1.png";
  static String careBanner_2 = "assets/images/banners/care_banner_2.png";

  static List<Widget> banners = [
    Image.asset(banner1,),
    Image.asset(banner1,),
    Image.asset(banner1,),
  ];
  static List<String> bannersS = [
  banner1,
  banner1,
  banner1,
   ];

  static List<Widget> careBanners = [
    Image.asset(careBanner_1),
    Image.asset(careBanner_2),
  ];

  static String relaxing = "assets/images/relaxing.png";
  static String meditation = "assets/images/meditation.png";
  static String yoga = "assets/images/yoga.png";
  static String breathing = "assets/images/beathing.png";

  static String profile = "assets/images/profile.png";
  static String calories = "assets/images/calories.png";

  static String morningYoga = "assets/images/morning_yoga.png";
  static String plankExercise = "assets/images/plank_exercise.png";

  static String doctor = "assets/images/doctor.png";
  static String iconCare = "assets/images/iconCare.png";

}