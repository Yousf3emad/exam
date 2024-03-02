import 'package:exam/screens/care_screen.dart';
import 'package:exam/screens/home_Screen.dart';
import 'package:exam/screens/workout_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        WorkOutScreen.routeName : (context) => WorkOutScreen(),
        HomeScreen.routeName : (context) =>  HomeScreen(),
        CareScreen.routeName : (context) =>  CareScreen(),
      },
    );
  }
}
