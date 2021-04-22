import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/awner/awnser_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...question.awnsers
              .map(
                (e) => AwnserWidget(
                  isRight: e.isRight,
                  title: e.title,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
