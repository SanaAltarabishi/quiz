// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/bloc/get_quiz_data_bloc.dart';
import 'package:quiz/bloc/quiz_bloc.dart';
import 'package:quiz/model/model.dart';

class Option extends StatefulWidget {
 
  //must take a bool value(from model) to make a condition for icon ..if true=>purple icon ..else =>red icon {by on tap }

  QuizModel questions;
  int time;
  int ind;
 // double size;

  Option({
    Key? key,
   required this.questions,
    required this.time,
    required this.ind,
   // required this.size,
  }) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    // bool correct = widget.questions.answers[widget.ind].isCorrect ; 
    return Center(
      child: InkWell(
        onTap: () {
          // setState(() {
          //   widget.size+=5;
          // });
          context.read<QuizBloc>().add(PressMe(
              quiz: widget.questions.answers[widget.ind].isCorrect,
              time: widget.time,
              observtime: widget.questions.availabileTime));

          // quiz : questions.answer[ind].isCorrect
          // if(correct){
          // setState(() {
          //            widget.size +=5;
          //           });}
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 240,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.questions.answers[widget.ind].answer,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black12)),
                      
                    // child: Center(
                    //   child: Icon(
                    //     Icons.check,
                    //     color: Colors.black12,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
