import 'package:devQuiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';

enum Level { Facil, Medio, Dificil, Perito }

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
}
