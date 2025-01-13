import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';
import 'package:netflix_clone/service_locator.dart';

class GetTvTrailerUsecase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getTvTrailer(params!);
  }
}
