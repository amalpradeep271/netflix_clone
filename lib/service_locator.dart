import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/data/auth/repositories/auth.dart';
import 'package:netflix_clone/data/auth/sources/auth_api_service.dart';
import 'package:netflix_clone/data/movie/repositories/movie.dart';
import 'package:netflix_clone/data/movie/sources/movie_api_services.dart';
import 'package:netflix_clone/data/tv/repositories/tv.dart';
import 'package:netflix_clone/data/tv/sources/tv_api_services.dart';
import 'package:netflix_clone/domain/auth/repositories/auth.dart';
import 'package:netflix_clone/domain/auth/usecases/is_loggedin_usecase.dart';
import 'package:netflix_clone/domain/auth/usecases/signin_usecase.dart';
import 'package:netflix_clone/domain/auth/usecases/signup_usecase.dart';
import 'package:netflix_clone/domain/movie/repositories/movie.dart';
import 'package:netflix_clone/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:netflix_clone/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';
import 'package:netflix_clone/domain/tv/usecases/get_popular_tv_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services

  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiServices>(MovieApiServicesImpl());
  sl.registerSingleton<TvApiServices>(TvApiServicesImpl());

  //Repositories

  sl.registerSingleton<AuthRepository>(AuthRepostoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  //Usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsloggedinUsecase>(IsloggedinUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(
      GetNowPlayingMoviesUsecase());
  sl.registerSingleton<GetPopularTvUsecase>(GetPopularTvUsecase());
}
