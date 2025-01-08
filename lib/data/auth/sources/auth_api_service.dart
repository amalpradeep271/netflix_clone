import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/data/auth/models/signin_req_params.dart';
import 'package:netflix_clone/data/auth/models/signup_req_params.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupReqParams params);
  Future<Either> signIn(SigninReqParams params);
  Future<bool> isLoggedIn();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signIn(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
}
