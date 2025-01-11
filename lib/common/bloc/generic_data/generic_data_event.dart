import 'package:netflix_clone/core/usecase/usecase.dart';

abstract class GenericDataEvent {}

/// Event for requesting data
class FetchData<T> extends GenericDataEvent {
  final UseCase usecase;
  final dynamic params;

  FetchData({required this.usecase, this.params});
}