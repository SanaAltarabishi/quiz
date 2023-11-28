import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz/model/model.dart';
//import 'package:quiz/model/quiz_model.dart';

import 'package:quiz/service/quiz_service.dart';

part 'get_quiz_data_event.dart';
part 'get_quiz_data_state.dart';
int correctCount=0;
int timeOutCounter=0;
int inCorrectCount=0;

class GetQuizDataBloc extends Bloc<GetQuizDataEvent, GetQuizDataState> {
  GetQuizDataBloc() : super(GetQuizDataInitial()) {
    on<GetQuiz>((event, emit)async {
     try{
emit(Loading());
final dynamic temp = await QuizServiceImp().getQuizCard();
   if (temp is String){
    emit(Error());
   }else{
    List <QuizModel> quiz = List.generate(temp.length,(index) => QuizModel.fromMap(temp[index])) ;
  emit(Success(quiz: quiz));
   }
     }catch(e){
     }
    }
   
    );

 }
}

