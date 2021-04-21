import 'package:devQuiz/core/app_images.dart';
import 'package:devQuiz/home/home_state.dart';
import 'package:devQuiz/shared/models/awnser_model.dart';
import 'package:devQuiz/shared/models/question_model.dart';
import 'package:devQuiz/shared/models/quiz_model.dart';
import 'package:devQuiz/shared/models/user_model.dart';

class HomeController {
  //USER
  //QUIZZERS

  HomeState state = HomeState.empty;
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Juliana Vitoria",
      photoURL: "https://avatars.githubusercontent.com/u/38433898?v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
        title: "NLW 5 Flutter",
        level: Level.Facil,
        image: AppImages.blocks,
        questions: [
          QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Sim, estou curtindo"),
            AwnserModel(title: "Não, estou com dificuldade"),
            AwnserModel(title: "Amando Flutter", isRight: true),
            AwnserModel(title: "Show de bola!!!"),
          ])
        ],
      )
    ];
  }
}
