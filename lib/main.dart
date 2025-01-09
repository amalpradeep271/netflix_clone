import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/core/configs/theme/app_theme.dart';
import 'package:netflix_clone/presentation/splash/bloc/splash_bloc.dart';
import 'package:netflix_clone/presentation/splash/bloc/splash_event.dart';
import 'package:netflix_clone/presentation/splash/pages/splash.dart';
import 'package:netflix_clone/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.transparentColor),
    );
    return BlocProvider(
      create: (context) => SplashBloc()..add(AppStartedEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix clone',
        theme: AppTheme.appTheme,
        home: SplashScreen(),
      ),
    );
  }
}
