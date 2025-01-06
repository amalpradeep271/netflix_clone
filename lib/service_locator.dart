import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/data/auth/repositories/auth.dart';
import 'package:netflix_clone/data/auth/sources/auth_api_service.dart';
import 'package:netflix_clone/domain/auth/repositories/auth.dart';
import 'package:netflix_clone/domain/auth/usecases/signup_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services

  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repositories

  sl.registerSingleton<AuthRepository>(AuthRepostoryImpl());

  //Usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
