import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_state.dart';

import '../bloc/button/button_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Widget? content;

  const BasicReactiveButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (_, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }
        return _initial();
      },
    );
  }

  Widget _loading() {
    return ElevatedButton(
      onPressed: null, // Disable button while loading
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: Container(
        height: height ?? 50,
        alignment: Alignment.center,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _initial() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: content ??
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
    );
  }
}
