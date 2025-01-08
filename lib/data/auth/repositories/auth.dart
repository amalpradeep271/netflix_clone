// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/data/auth/models/signin_req_params.dart';
import 'package:netflix_clone/data/auth/models/signup_req_params.dart';

import 'package:netflix_clone/data/auth/sources/auth_api_service.dart';
import 'package:netflix_clone/domain/auth/repositories/auth.dart';
import 'package:netflix_clone/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepostoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signUp(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
          'token',
          data['user']['token'],
        );
        return Right(data);
      },
    );
  }

  @override
  Future<Either> sigIn(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signIn(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
          'token',
          data['user']['token'],
        );
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
