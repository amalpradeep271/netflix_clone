import 'package:flutter/material.dart';
import 'package:netflix_clone/core/configs/theme/app_theme.dart';
import 'package:netflix_clone/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix clone',
      theme: AppTheme.appTheme, 
      home: SplashScreen(),
    );
  }
}
