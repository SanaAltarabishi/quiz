// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

class CorrectAnswer extends QuizState {
int correctCount;
  CorrectAnswer({
    required this.correctCount,
  });

}

class InCorrectAnswer extends QuizState {
  int inCorrectCount ;
  InCorrectAnswer({
    required this.inCorrectCount,
  }); 
}

class TimeOutAnswer extends QuizState {
  int timeOutCounter;
  TimeOutAnswer({
    required this.timeOutCounter,
  });
}
