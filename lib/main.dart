import 'package:flutter/material.dart';
import 'package:profile_app/pages/profile_page.dart';
import 'package:profile_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ProfilePage(),
    );
  }
}