import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35),
        width: double.maxFinite, //centralizar o tamanho
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Image.asset(AppImages.trophy),
            ),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  // definir altura para o espaçamento
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você conclui ",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                          text: "\n com $result de $length acertos.",
                          style: AppTextStyles.body)
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              // definir altura para o espaçamento
              height: 61,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'DevQuiz NLW 5 - Quiz Result: $title \nObtain: ${result / length}% utilization');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // definir altura para o espaçamento
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparente(
                            label: "Voltar ao início",
                            onTap: () {
                              Navigator.pop(
                                  context); // pop - volta pra tela anterior
                            }),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
