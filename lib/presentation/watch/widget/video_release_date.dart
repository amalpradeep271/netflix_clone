import 'package:flutter/material.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;
  const VideoReleaseDate({required this.releaseDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 20,
          color: AppColors.greyColor,
        ),
        Text(
          ' ${releaseDate.toString().split(' ')[0]}',
          style: const TextStyle(
            color: AppColors.greyColor,
          ),
        )
      ],
    );
  }
}
