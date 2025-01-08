import 'package:flutter/material.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';

class DisplayMessage {
  static void errorMessage(String message, BuildContext context) {
    var snackbar = SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Center(child: Text(message)),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
