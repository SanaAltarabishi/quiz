
import 'dart:convert';

import 'package:collection/collection.dart';

class Answer {
  String answer;
  bool isCorrect;
  Answer({
    required this.answer,
    required this.isCorrect,
  });

  Answer copyWith({
    String? answer,
    bool? isCorrect,
  }) {
    return Answer(
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      answer: map['answer'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answer(answer: $answer, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;
  
    return 
      other.answer == answer &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;
  }
class QuizModel {
  String question;
  num availabileTime;
  String author;
  List<Answer> answers;
  QuizModel({
    required this.question,
    required this.availabileTime,
    required this.author,
    required this.answers,
  });

  QuizModel copyWith({
    String? question,
    num? availabileTime,
    String? author,
    List<Answer>? answers,
  }) {
    return QuizModel(
      question: question ?? this.question,
      availabileTime: availabileTime ?? this.availabileTime,
      author: author ?? this.author,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'availabileTime': availabileTime,
      'author': author,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      availabileTime: map['availabileTime'] as num,
      author: map['author'] as String,
      answers: List<Answer>.from((map['answers'] as List<dynamic>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizModel(question: $question, availabileTime: $availabileTime, author: $author, answers: $answers)';
  }

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.question == question &&
      other.availabileTime == availabileTime &&
      other.author == author &&
      listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return question.hashCode ^
      availabileTime.hashCode ^
      author.hashCode ^
      answers.hashCode;
  }
}


