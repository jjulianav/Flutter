import 'package:devQuiz/core/app_images.dart';
import 'package:devQuiz/home/home_state.dart';
import 'package:devQuiz/shared/models/awnser_model.dart';
import 'package:devQuiz/shared/models/question_model.dart';
import 'package:devQuiz/shared/models/quiz_model.dart';
import 'package:devQuiz/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  //USER
  //QUIZZERS

  final stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty); // atuliazar a tela sem restart

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Juliana Vitoria",
      photoURL: "https://avatars.githubusercontent.com/u/38433898?v=4",
    );
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        questionAnswered: 1,
        title: "NLW 5 Flutter",
        level: Level.Facil,
        image: AppImages.blocks,
        questions: [
          QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Sim, estou curtindo"),
            AwnserModel(title: "Não, estou com dificuldade"),
            AwnserModel(title: "Amando Flutter", isRight: true),
            AwnserModel(title: "Show de bola!!!"),
          ]),
          QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Sim, estou curtindo"),
            AwnserModel(title: "Não, estou com dificuldade"),
            AwnserModel(title: "Amando Flutter", isRight: true),
            AwnserModel(title: "Show de bola!!!"),
          ]),
        ],
      )
    ];
    state = HomeState.sucess;
  }
}
