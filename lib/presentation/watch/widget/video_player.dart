import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/presentation/watch/bloc/trailer/trailer_bloc.dart';
import 'package:netflix_clone/presentation/watch/bloc/trailer/trailer_event.dart';
import 'package:netflix_clone/presentation/watch/bloc/trailer/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrailerBloc()..add(FetchTrailer(movieId: id)),
        child: BlocBuilder<TrailerBloc, TrailerState>(
          builder: (context, state) {
            if (state is TrailerLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
          
            if (state is TrailerLoaded) {
              return YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
              );
            }
            if (state is TrailerFailure) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
