import 'package:flutter/material.dart';
import 'package:facialreco/screens/buttonScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttonScreen(),
      darkTheme: ThemeData.dark(),
    );
  }
}
