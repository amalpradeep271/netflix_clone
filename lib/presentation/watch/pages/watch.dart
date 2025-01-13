// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/common/widgets/custom_appbar.dart';
import 'package:netflix_clone/domain/movie/entities/movie.dart';
import 'package:netflix_clone/presentation/watch/widget/recommentation_movies.dart';
import 'package:netflix_clone/presentation/watch/widget/similar_movies.dart';
import 'package:netflix_clone/presentation/watch/widget/video_overview.dart';
import 'package:netflix_clone/common/widgets/video_player.dart';
import 'package:netflix_clone/presentation/watch/widget/video_release_date.dart';
import 'package:netflix_clone/presentation/watch/widget/video_title.dart';
import 'package:netflix_clone/presentation/watch/widget/video_vote_average.dart';

class MovieWatchScreen extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchScreen({
    super.key,
    required this.movieEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(
              title: movieEntity.title!,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(
                  releaseDate: movieEntity.releaseDate!,
                ),
                VideoVoteAverage(
                  voteAverage: movieEntity.voteAverage!,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(
              overview: movieEntity.overview!,
            ),
            const SizedBox(
              height: 16,
            ),
            RecommendationMovies(
              movieId: movieEntity.id!,
            ),
            const SizedBox(
              height: 16,
            ),
            SimilarMovies(
              movieId: movieEntity.id!,
            )
          ],
        ),
      ),
    );
  }
}
