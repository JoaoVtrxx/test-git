import 'package:flutter/material.dart';
import 'package:flutter_1/home.dart';
import 'package:flutter_1/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
