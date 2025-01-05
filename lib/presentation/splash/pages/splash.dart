import 'package:flutter/material.dart';
import 'package:netflix_clone/core/configs/assets/app_gifs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(AppGifs.splashBackground, fit: BoxFit.cover),
      ),
    );
  }
}
