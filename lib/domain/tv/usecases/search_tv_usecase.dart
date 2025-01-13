import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';
import 'package:netflix_clone/service_locator.dart';

class SearchTVUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepository>().searchTV(params!);
  }
}
