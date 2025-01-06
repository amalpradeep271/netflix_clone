import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/presentation/auth/pages/signup.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget _signinText() {
    return Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: 'Email'));
  }

  Widget _passwordField() {
    return TextField(decoration: InputDecoration(hintText: 'Password'));
  }

  Widget _signinButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ElevatedButton(onPressed: () {}, child: Text('Sign In')),
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