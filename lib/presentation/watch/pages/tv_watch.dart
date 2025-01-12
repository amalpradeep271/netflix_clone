import 'package:flutter/material.dart';
import 'package:netflix_clone/common/widgets/custom_appbar.dart';
import 'package:netflix_clone/domain/tv/enitities/tv.dart';
import 'package:netflix_clone/presentation/watch/widget/recommentation_tvs.dart';
import 'package:netflix_clone/presentation/watch/widget/similar_tvs.dart';
import 'package:netflix_clone/presentation/watch/widget/tv_keywords.dart';
import 'package:netflix_clone/presentation/watch/widget/video_overview.dart';
import 'package:netflix_clone/presentation/watch/widget/video_player.dart';
import 'package:netflix_clone/presentation/watch/widget/video_title.dart';
import 'package:netflix_clone/presentation/watch/widget/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TvEntity tvEntity;
  const TVWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(
              title: tvEntity.name!,
            ),
            const SizedBox(
              height: 16,
            ),
              (
              tvId: tvEntity.id!,
            ),
            const SizedBox(
              height: 16,
            ),
            VideoVoteAverage(
              voteAverage: tvEntity.voteAverage!,
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(
              overview: tvEntity.overview!,
            ),
            const SizedBox(
              height: 16,
            ),
            RecommendationTVs(
              tvId: tvEntity.id!,
            ),
            const SizedBox(
              height: 16,
            ),
            SimilarTVs(
              tvId: tvEntity.id!,
            )
          ],
        ),
      ),
    );
  }
}
