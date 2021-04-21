import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';

enum Level { Facil, Medio, Dificil, Perito }

extension LevelStringExt on String {
  Level get parse => {
        "Facil": Level.Facil,
        "Medio": Level.Medio,
        "Dificil": Level.Dificil,
        "Perito": Level.Perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.Facil: "Facil",
        Level.Medio: "Medio",
        Level.Dificil: "Dificil",
        Level.Perito: "Perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
