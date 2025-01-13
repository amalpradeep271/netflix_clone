import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/movie/entities/trailer.dart';
import 'package:netflix_clone/common/bloc/trailer/trailer_event.dart';
import 'package:netflix_clone/common/bloc/trailer/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  TrailerBloc() : super(TrailerLoading()) {
    on<FetchTrailer>(_onFetchTrailer);
  }

  Future<void> _onFetchTrailer(
    FetchTrailer event,
    Emitter<TrailerState> emit,
  ) async {
    emit(TrailerLoading());

    var returnedData = await event.usecase.call(
      params: event.params,
    );

    returnedData.fold(
      (error) {
        emit(TrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;

        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

        emit(
          TrailerLoaded(youtubePlayerController: controller),
        );
      },
    );
  }
}
