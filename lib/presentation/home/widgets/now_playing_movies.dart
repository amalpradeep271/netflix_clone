import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_event.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';
import 'package:netflix_clone/common/widgets/custom_movie_card.dart';
import 'package:netflix_clone/domain/movie/entities/movie.dart';
import 'package:netflix_clone/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:netflix_clone/service_locator.dart';

class NowplayingMovies extends StatelessWidget {
  const NowplayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataBloc()
          ..add(
            FetchData<List<MovieEntity>>(
              usecase: sl<GetNowPlayingMoviesUsecase>(),
            ),
          ),
        child: BlocBuilder<GenericDataBloc, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (state is DataLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movieEntity: state.data[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: state.data.length,
                ),
              );
            }

            if (state is FailureLoadData) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
