import 'package:netflix_clone/domain/tv/enitities/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> tv;

  PopularTvLoaded({required this.tv});
}

class PopularTvFailure extends PopularTvState {
  final String errorMessage;

  PopularTvFailure({required this.errorMessage});
}