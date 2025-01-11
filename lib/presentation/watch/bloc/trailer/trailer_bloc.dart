import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/movie/entities/trailer.dart';
import 'package:netflix_clone/domain/movie/usecases/get_movie_trailer_usecase.dart';
import 'package:netflix_clone/presentation/watch/bloc/trailer/trailer_event.dart';
import 'package:netflix_clone/presentation/watch/bloc/trailer/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../service_locator.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  TrailerBloc() : super(TrailerLoading()) {
    on<FetchTrailer>(_onGetMovieTrailer);
  }

  Future<void> _onGetMovieTrailer(
    FetchTrailer event,
    Emitter<TrailerState> emit,
  ) async {
    emit(TrailerLoading());

    var returnedData = await sl<GetMovieTrailerUsecase>().call(
      params: event.movieId,
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
