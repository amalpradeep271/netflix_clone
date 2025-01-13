import 'package:netflix_clone/core/usecase/usecase.dart';

abstract class TrailerEvent {}

class FetchTrailer extends TrailerEvent {
  final UseCase usecase;
  final dynamic params;

  FetchTrailer({required this.usecase, required this.params});

}
