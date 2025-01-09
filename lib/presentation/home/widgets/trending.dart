import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/configs/assets/app_images.dart';
import 'package:netflix_clone/presentation/home/bloc/trending_movie_cubit.dart';
import 'package:netflix_clone/presentation/home/bloc/trending_movie_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingMovieCubit()..getTrendingMovies(),
        child: BlocBuilder<TrendingMovieCubit, TrendingMoviesState>(
          builder: (context, state) {
            if (state is TrendingMoviesLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is TrendingMoviesLoaded) {
              return FanCarouselImageSlider.sliderType2(
                imagesLink: state.movies
                    .map((item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString())
                    .toList(),
                isAssets: false,
                autoPlay: false,
                sliderHeight: 400,
                // showIndicator: true,
              );
            }

            if (state is TrendingMoviesFailure) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
