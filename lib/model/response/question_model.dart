// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quiz_showdown/model/base/answer_model.dart';

class QuestionModel {
  String question;
  num availabileTime;
  String author;
  List<AnswerModel> answers;
  String id;
  QuestionModel({
    required this.question,
    required this.availabileTime,
    required this.author,
    required this.answers,    
    required this.id,
  });
  

  QuestionModel copyWith({
    String? question,
    num? availabileTime,
    String? author,
    List<AnswerModel>? answers,
    
    String? id,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      availabileTime: availabileTime ?? this.availabileTime,
      author: author ?? this.author,
      answers: answers ?? this.answers,      
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'availabileTime': availabileTime,
      'author': author,
      'answers': answers.map((x) => x.toMap()).toList(),
      
      'id': id,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      availabileTime: map['availabileTime'] as num,
      author: map['author'] as String,
      answers: List<AnswerModel>.from((map['answers'] as List<dynamic>).map<AnswerModel>((x) => AnswerModel.fromMap(x as Map<String,dynamic>),),),
      
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(question: $question, availabileTime: $availabileTime, author: $author, answers: $answers, id: $id)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.question == question &&
      other.availabileTime == availabileTime &&
      other.author == author &&
      listEquals(other.answers, answers) &&      
      other.id == id;
  }

  @override
  int get hashCode {
    return question.hashCode ^
      availabileTime.hashCode ^
      author.hashCode ^
      answers.hashCode ^      
      id.hashCode;
  }
}
