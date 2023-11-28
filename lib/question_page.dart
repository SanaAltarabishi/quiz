// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/bloc/get_quiz_data_bloc.dart';
import 'package:quiz/bloc/quiz_bloc.dart';
import 'package:quiz/main.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/widgets/option.dart';

double animateWidthTrue = 0;
double animateWidthFalde = 0;

class QuestionPage extends StatelessWidget {
  QuizModel questionModel;
  int time;
  QuestionPage({
    Key? key,
    required this.questionModel,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double animateWidth = 6;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff8D376F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('images/circlequiz.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xffF3BD6B),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('images/thunder.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 142),
                        child: Container(
                          height: 205,
                          width: 281,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffDA8BD9), Color(0xffF3BD6B)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 6),
                                        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                        width: animateWidthTrue,
                                        height: 5,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: AnimatedContainer(
                                        //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                        duration: Duration(milliseconds: 6),
                                        width: animateWidthFalde,
                                        height: 5,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Text(
                                    'Question',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffA42FC1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Center(
                                  child: Text(
                                    questionModel.question,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 107),
                        child: Container(
                          width: 67,
                          height: 67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffDA8BD9), Color(0xffF3BD6B)],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                  value: start / 20,
                                  color: Color(0xff8D376F),
                                  strokeWidth: 4,
                                  strokeAlign: 3.5,
                                ),
                              ),
                              Center(
                                child: Text(
                                  start.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff8D376F)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset('images/thunderbolt 2.png'),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: questionModel.answers.length,
                      itemBuilder: (context, ind) => Option(
                            questions: questionModel,
                            time: start,
                            ind: ind,
                          )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
