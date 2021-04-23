import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void initState() {
    // controller.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage <
        widget.questions
            .length) // se a pagina atual for menor que o tamanho das questões
      pageController.nextPage(
        duration: Duration(milliseconds: 50),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.hits++;
    }
    nextPage();
  }

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
              Expanded(child: BackButton()),
              // IconButton( //outra maneira de fazer o botãoa para voltar a pg
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(Icons.close)),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ) // pra não renderizar a pg toda
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //travar scroll da pagina
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(question: e, onSelected: onSelected))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            // renderiza o button Confirmar apenas no final do quiz
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Confimar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    result: controller.hits,
                                    length: widget.questions.length,
                                    title: widget.title,
                                  )),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
