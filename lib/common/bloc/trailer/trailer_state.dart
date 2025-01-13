import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

class TrailerFailure extends TrailerState {
  final String errorMessage;

  TrailerFailure({required this.errorMessage});
}


