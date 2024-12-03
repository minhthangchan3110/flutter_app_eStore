// ignore_for_file: prefer_const_constructors

import 'package:admin_ecommerce/screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Loại bỏ từ khóa '' tại đây
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
