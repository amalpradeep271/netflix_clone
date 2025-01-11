import 'package:flutter/material.dart';
import 'package:netflix_clone/core/configs/theme/app_colors.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({required this.voteAverage, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.amberColor,
          size: 20,
        ),
        Text(' ${voteAverage.toStringAsFixed(1)}'),
      ],
    );
  }
}
