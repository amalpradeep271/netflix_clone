import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/helper/navigator/app_navigator.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';
import 'package:netflix_clone/presentation/auth/pages/signin.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            _signupText(),
            _emailField(),
            _passwordField(),
            _signupButton(context),
            _signinText(context),
          ],
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
    return TextField(decoration: InputDecoration(hintText: 'Email'));
  }

  Widget _passwordField() {
    return TextField(decoration: InputDecoration(hintText: 'Password'));
  }

  Widget _signupButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
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
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignInScreen());
                  },
          ),
        ],
      ),
    );
  }
}
