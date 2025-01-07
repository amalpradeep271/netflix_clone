import 'package:netflix_clone/core/usecase/usecase.dart';

abstract class ButtonEvent {}

class ButtonExecuteEvent extends ButtonEvent {
  final dynamic params;
  final UseCase usecase;

  ButtonExecuteEvent({required this.params, required this.usecase});
}