import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/widgets/custom_movie_card.dart';
import 'package:netflix_clone/presentation/home/bloc/now_playing/now_playing_movie_bloc.dart';
import 'package:netflix_clone/presentation/home/bloc/now_playing/now_playing_movie_event.dart';
import 'package:netflix_clone/presentation/home/bloc/now_playing/now_playing_movie_state.dart';

class NowplayingMovies extends StatelessWidget {
  const NowplayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            NowPlayingMoviesBloc()..add(FetchNowPlayingMovies()),
        child: BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
          builder: (context, state) {
            if (state is NowPlayingMoviesLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is NowPlayingMoviesLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movieEntity: state.movies[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: state.movies.length,
                ),
              );
            }

            if (state is NowPlayingMoviesFailure) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
