import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetRecommendationTvsUseCase extends UseCase<Either,int> {
  
  @override
  Future<Either> call({int ? params}) async {
    return await sl<TvRepository>().getRecommendationTv(params!);
  }
  
}