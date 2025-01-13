import 'package:dartz/dartz.dart';
import 'package:netflix_clone/common/helper/mapper/keyword_mapper.dart';
import 'package:netflix_clone/common/helper/mapper/trailer_mapper.dart';
import 'package:netflix_clone/common/helper/mapper/tv_mapper.dart';
import 'package:netflix_clone/data/movie/models/trailer.dart';
import 'package:netflix_clone/data/tv/models/keyword.dart';
import 'package:netflix_clone/data/tv/models/tv.dart';
import 'package:netflix_clone/data/tv/sources/tv_api_services.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';
import 'package:netflix_clone/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvApiServices>().getPopularTv();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    var returnedData = await sl<TvApiServices>().getRecommendationTv(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    var returnedData = await sl<TvApiServices>().getSimilarTv(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TvApiServices>().getSimilarTv(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var keywords = List.from(data['results'])
          .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(keywords);
    });
  }
  
  @override
  Future<Either> searchTV(String query)async {
      var returnedData = await sl<TvApiServices>().searchTV(query);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
     var movies = List.from(data['results'])
          .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> getTvTrailer(int tvId)async {
   var returnedData = await sl<TvApiServices>().getTvTrailer(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        if (data['results'].isEmpty) {
          return Left("No Trailer found");
        }
        var firstData = data['results'][0];
        var dat = TrailerMapper.toEntity(TrailerModel.fromJson(firstData));
        return Right(dat);
      },
    );
  }
}
