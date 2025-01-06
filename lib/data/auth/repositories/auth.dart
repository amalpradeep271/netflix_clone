// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/data/auth/models/signup_req_params.dart';

import 'package:netflix_clone/data/auth/sources/auth_api_service.dart';
import 'package:netflix_clone/domain/auth/repositories/auth.dart';
import 'package:netflix_clone/service_locator.dart';

class AuthRepostoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    return await sl<AuthApiService>().signUp(params);
  }
}
