import 'package:dartz/dartz.dart';
import 'package:netflix_clone/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParams params);
}
