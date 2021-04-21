import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_widget.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar.dart';
import 'package:dev_quiz/home/widgets/elevel_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(Key? key)
      : super(key: key); // ? - significa que a variavel pode ser nula
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getQuizzes();
    controller.getUser();

    controller.stateNotifier.addListener(() {
      setState(() {});
    }); // avisa que teve alteração no controller
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Períto",
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map(
                          (e) => QuizCardWidget(
                            percent: e.questionAnswered /
                                e.questions
                                    .length, // subtrati o n° de questions awnsers com o n° de questions
                            title: e.title,
                            completed:
                                "${e.questionAnswered}/${e.questions.length}",
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen)),
        ),
      );
    }
  }
}
