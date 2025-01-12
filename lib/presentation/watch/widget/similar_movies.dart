import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_event.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';
import 'package:netflix_clone/common/widgets/custom_movie_card.dart';
import 'package:netflix_clone/domain/movie/entities/movie.dart';
import 'package:netflix_clone/domain/movie/usecases/get_similar_movies_usecase.dart';
import 'package:netflix_clone/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataBloc()..add(
            FetchData<List<MovieEntity>>(
                usecase: sl<GetSimilarMoviesUsecase>(), params: movieId),
          ),
      child: BlocBuilder<GenericDataBloc,GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading){
            return const Center(
              child: CupertinoActivityIndicator()
            );
          }
          
          if (state is DataLoaded ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.data.length
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      )
    );
  }
}