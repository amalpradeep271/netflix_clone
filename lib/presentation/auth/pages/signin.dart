import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_event.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/common/widgets/basic_reactive_button.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/data/auth/models/signin_req_params.dart';
import 'package:netflix_clone/domain/auth/usecases/signin_usecase.dart';
import 'package:netflix_clone/presentation/auth/pages/signup.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonBloc(),
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              _emailField(),
              _passwordField(),
              _signinButton(context),
              _signupText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  // Widget _signinButton(BuildContext context) {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width / 1.5,
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         await sl<SigninUsecase>().call(
  //           params: SigninReqParams(
  //             email: _emailController.text,
  //             password: _passwordController.text,
  //           ),
  //         );
  //       },
  //       child: Text('Sign In'),
  //     ),
  //   );
  // }

  Widget _signinButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            buttonBloc: context.read<ButtonBloc>(),
            onPressed: () {
              var signInReq = SigninReqParams(
                email: _emailController.text,
                password: _passwordController.text,
              );
              ButtonBloc().add(
                ButtonExecuteEvent(params: signInReq, usecase: SigninUsecase()),
              );
            },
            title: 'Sign In',
          );
        },
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Dont you have an account?"),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(color: AppColors.blueColor),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignupScreen());
                  },
          ),
        ],
      ),
    );
  }
}
