import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/movie/repositories/movie.dart';
import 'package:netflix_clone/service_locator.dart';

class SearchMovieUseCase extends UseCase<Either,String> {
  
  @override
  Future<Either> call({String ? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
  
}