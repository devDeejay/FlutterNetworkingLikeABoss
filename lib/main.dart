import 'package:flutter/material.dart';
import 'package:networking_like_a_boss/First.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking like a boss',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black87),
      home: HomeScreen(),
    );
  }
}

const Color kPrimaryColor = const Color(0xFF111517);
