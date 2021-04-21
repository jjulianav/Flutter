import 'package:dev_quiz/challenge/widgets/awner/awnser_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(
            isRight: false,
            isSelected: true,
            title: "Kide desenvolvimento de interface de usuário.",
          ),
          AwnserWidget(
            isRight: true,
            isSelected: true,
            title:
                "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AwnserWidget(
            isRight: false,
            isSelected: true,
            title: "Acho que é uma marca de café do Himalaia.",
          ),
          AwnserWidget(
            isRight: true,
            isSelected: true,
            title: "Possibilita a criação de desktops que são muito incríveis.",
          ),
        ],
      ),
    );
  }
}
