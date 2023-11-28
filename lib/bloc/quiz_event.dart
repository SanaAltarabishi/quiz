// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class PressMe extends QuizEvent {
  bool quiz;
  int time ;
  num observtime;
  PressMe({
    required this.quiz,
    required this.time,
    required this.observtime,
  });
}
