import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/auth/usecases/is_loggedin_usecase.dart';
import 'package:netflix_clone/presentation/splash/bloc/splash_state.dart';
import 'package:netflix_clone/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(milliseconds: 2000));
    var isLoggedIn=await sl<IsloggedinUsecase>().call();
    if(isLoggedIn){
      emit(Authenticated());
    }else{
    emit(UnAuthenticated());

    }
  }
}
