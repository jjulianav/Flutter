import 'package:devQuiz/core/app_widget.dart';
import 'package:devQuiz/home/widgets/appbar/app_bar.dart';
import 'package:devQuiz/home/widgets/elevel_button/level_button_widget.dart';
import 'package:devQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(Key? key)
      : super(key: key); // ? - significa que a variavel pode ser nula
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
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
                  children: [
                    QuizCardWidget(
                      title: "Gerenciamento de Estado",
                    ),
                    QuizCardWidget(
                      title: "Contruindo Interfaces",
                    ),
                    QuizCardWidget(
                      title: "Integração",
                    ),
                    QuizCardWidget(
                      title: "Widgets",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
