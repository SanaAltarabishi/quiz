import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';
int correctCount=0;
int timeOutCounter=0;
int inCorrectCount=0;
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<PressMe>((event, emit) {
if(event.observtime>event.time){
  if (event.quiz){
  emit (CorrectAnswer(correctCount:correctCount+1));

  }else {
    emit(InCorrectAnswer(inCorrectCount:inCorrectCount+1 ));
  }
}else {
  emit(TimeOutAnswer(timeOutCounter:timeOutCounter+1 ));
}
    });
  }
}
