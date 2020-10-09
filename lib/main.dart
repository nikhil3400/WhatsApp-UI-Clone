import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xff075E54),
      ),
      home: Home(),
    );
  }
}