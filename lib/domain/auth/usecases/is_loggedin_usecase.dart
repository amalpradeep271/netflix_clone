import 'package:netflix_clone/core/usecase/usecase.dart';
import 'package:netflix_clone/domain/auth/repositories/auth.dart';
import 'package:netflix_clone/service_locator.dart';

class IsloggedinUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
