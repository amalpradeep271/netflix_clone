import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/core/configs/assets/app_gifs.dart';
import 'package:netflix_clone/presentation/auth/pages/signin.dart';
import 'package:netflix_clone/presentation/home/pages/home.dart';
import 'package:netflix_clone/presentation/splash/bloc/splash_bloc.dart';
import 'package:netflix_clone/presentation/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (_, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SignInScreen());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomeScreen());
          }
        },
        child: SizedBox.expand(
          child: Image.asset(AppGifs.splashBackground, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
