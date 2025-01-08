import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_event.dart';
import 'package:netflix_clone/common/bloc/button/button_state.dart';
import 'package:netflix_clone/common/helper/message/display_message.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/common/widgets/basic_reactive_button.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/data/auth/models/signup_req_params.dart';
import 'package:netflix_clone/domain/auth/usecases/signup_usecase.dart';
import 'package:netflix_clone/presentation/auth/pages/signin.dart';
import 'package:netflix_clone/presentation/home/pages/home.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonBloc(),
      child: Scaffold(
        body: BlocListener<ButtonBloc, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              DisplayMessage.errorMessage(state.errorMessage, context);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context, const HomeScreen());
            }
          },
          child: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signupText(),
                _emailField(),
                _passwordField(),
                _signupButton(context),
                _signinText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      'Sign Up',
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

  Widget _signupButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              var singupReq = SignupReqParams(
                email: _emailController.text,
                password: _passwordController.text,
              );
              context.read<ButtonBloc>().add(
                    ButtonExecuteEvent(
                      params: singupReq,
                      usecase: SignupUseCase(),
                    ),
                  );
            },
            title: 'Sign Up',
          );
        },
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Do you have an account?"),
          TextSpan(
            text: "Sign In",
            style: TextStyle(color: AppColors.blueColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignInScreen());
              },
          ),
        ],
      ),
    );
  }
}
