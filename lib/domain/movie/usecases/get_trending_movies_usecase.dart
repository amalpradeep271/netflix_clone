import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/movie/repositories/movie.dart';

import '../../../service_locator.dart';

class GetTrendingMoviesUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
