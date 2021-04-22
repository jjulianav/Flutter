import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          // não sobre sai na appBar
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              // IconButton( //outra maneira de fazer o botãoa para voltar a pg
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(Icons.close)),
              QuestionIndicatorWidget(),
            ],
          ),
        ),
      ),
      body: QuizWidget(
        question: widget.questions[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NextButtonWidget.white(
                  label: "Pular",
                  onTap: () {},
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: NextButtonWidget.green(
                  label: "Confirmar",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
