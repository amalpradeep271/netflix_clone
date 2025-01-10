import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/common/widgets/custom_appbar.dart';
import 'package:netflix_clone/core/configs/assets/app_vectors.dart';
import 'package:netflix_clone/presentation/home/widgets/category_text.dart';
import 'package:netflix_clone/presentation/home/widgets/now_playing_movies.dart';
import 'package:netflix_clone/presentation/home/widgets/popular_tv.dart';
import 'package:netflix_clone/presentation/home/widgets/trending_movies_sliders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
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
      )),
    );
  }
}
