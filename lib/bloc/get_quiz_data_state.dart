part of 'get_quiz_data_bloc.dart';

@immutable
sealed class GetQuizDataState {}

final class GetQuizDataInitial extends GetQuizDataState {}

class Success extends GetQuizDataState {
  List<QuizModel> quiz;
  Success({
    required this.quiz,
  });
}

class Error extends GetQuizDataState {}

class Loading extends GetQuizDataState {}
