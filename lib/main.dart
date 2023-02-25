import 'package:flutter/material.dart';
import 'package:flutter_1/home.dart';
import 'package:flutter_1/screens/login_screen.dart';
import 'package:flutter_1/screens/cadastro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      home: CadastroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
