import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:netflix_clone/common/bloc/internet/internet.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/common/widgets/custom_appbar.dart';
import 'package:netflix_clone/core/configs/assets/app_vectors.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/presentation/auth/pages/signin.dart';
import 'package:netflix_clone/presentation/home/widgets/category_text.dart';
import 'package:netflix_clone/presentation/home/widgets/now_playing_movies.dart';
import 'package:netflix_clone/presentation/home/widgets/popular_tv.dart';
import 'package:netflix_clone/presentation/home/widgets/trending_movies_sliders.dart';
import 'package:netflix_clone/presentation/search/pages/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(InternetConnectionChecker()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();

            await prefs.remove('token');
            if (context.mounted) {
              AppNavigator.pushReplacement(context, SignInScreen());
            }
          },
          child: Icon(Icons.logout),
        ),
        appBar: BasicAppbar(
          hideBack: true,
          title: SvgPicture.asset(AppVectors.logo),
          action: IconButton(
            onPressed: () {
              AppNavigator.push(context, SearchScreen());
            },
            icon: Icon(Icons.search),
          ),
        ),
        body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
          builder: (context, state) {
            if (state == ConnectivityState.disconnected) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Internet Connection',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ConnectivityCubit>().checkConnection();

                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            // Replace with your actual HomeScreen content
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryText(
                  title: "Trendings 🔥",
                ),
                TrendingMovies(),
                SizedBox(
                  height: 10,
                ),
                CategoryText(
                  title: "Now Playing",
                ),
                SizedBox(
                  height: 10,
                ),
                NowplayingMovies(),
                SizedBox(
                  height: 10,
                ),
                CategoryText(
                  title: "Popular Tv",
                ),
                SizedBox(
                  height: 10,
                ),
                PopularTv(),
                SizedBox(
                  height: 10,
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
