import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/bloc/bloc_observe.dart';
import 'package:quiz/bloc/get_quiz_data_bloc.dart';
import 'package:quiz/bloc/quiz_bloc.dart';
import 'package:quiz/question_page.dart';
import 'package:quiz/service/quiz_service.dart';
import 'package:quiz/widgets/LoadingCard.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetQuizDataBloc()..add(GetQuiz()),
          ),
          BlocProvider(
            create: (context) => QuizBloc(),
          )
        ],
        child: Questions(),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

Timer timer = Timer(Duration(seconds: 1), () {});
PageController controllerPage = PageController();
int start = 0;

class _QuestionsState extends State<Questions> {
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          start++;
        });
      },
    );
  }

  @override
  void initState() {
    startTimer();
  }

  Widget build(BuildContext context) {
    // QuizServiceImp get = QuizServiceImp();
    return Scaffold(
      body: BlocBuilder<GetQuizDataBloc, GetQuizDataState>(
        builder: (context, state) {
          if (state is Success) {
            return PageView.builder(
              itemCount: state.quiz.length,
              controller: controllerPage,
              onPageChanged: (value) {
                start = 0;
              },
              itemBuilder: (context, index) =>
                  BlocListener<QuizBloc, QuizState>(
                listener: (context, state) {
                  if (state is CorrectAnswer) {
                    controllerPage.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.linear);
                    timer.cancel();
                    startTimer();
                      animateWidthTrue += 10;
                  } else if (state is InCorrectAnswer) {
                    controllerPage.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.linear);
                         animateWidthFalde += 10;
                  } else {
                    controllerPage.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.linear);
                  }
                },
                child:
                    QuestionPage(questionModel: state.quiz[index], time: start),
              ),
            );
          } else {
            return LoadingCard();
          }
        },
      ),

      //   body: FutureBuilder(
      // future: get.getQuizCard(),
      // builder: (context, snapshot) {
      //   if (snapshot.hasData) {
      //     return PageView.builder(
      //       //to navigate from page to other using bloc listener (controller .nextpage..)
      //       // animated container by using this in order not to restart again !!

      //       controller: controllerPage,
      //       onPageChanged: (value) {
      //         start = 0;
      //       },
      //       itemCount: 4,
      //       itemBuilder: (context, index) => BlocListener<QuizBloc, QuizState>(
      //           listener: (context, state) {
      //             if (state is CorrectAnswer) {
      //               controllerPage.nextPage(
      //                   duration: Duration(seconds: 1), curve: Curves.linear);
      //               timer.cancel();
      //               startTimer();
      //             } else if (state is InCorrectAnswer) {
      //               // timer.cancel();
      //               controllerPage.nextPage(
      //                   duration: Duration(seconds: 1), curve: Curves.linear);
      //             } else {
      //               controllerPage.nextPage(
      //                   duration: Duration(seconds: 1), curve: Curves.linear);
      //             }
      //           },
      //           child: QuestionPage()),
      //     );
      //   } else if (snapshot.hasError) {
      //     return Center(child: Text('error'));
      //   } else {
      //     return LoadingCard();
      //   }
      // },
      // )
    );
  }
}
