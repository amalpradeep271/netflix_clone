import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/movie/repositories/movie.dart';
import 'package:netflix_clone/service_locator.dart';

class GetMovieTrailerUsecase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
}