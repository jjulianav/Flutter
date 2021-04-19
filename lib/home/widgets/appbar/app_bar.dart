import 'package:devQuiz/core/app_gradients.dart';
import 'package:devQuiz/core/app_text_styles.dart';
import 'package:devQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // coloca os componentes pra baixo
                    children: [
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: "Juliana Vitoria",
                              style: AppTextStyles.titleBold,
                            )
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        //   image: DecorationImage(
                        //     image: NetworkImage(
                        //         "https://lh3.googleusercontent.com/lUt8Rlb4YeHpKWtpwjMm1O5UN7c_ud5nC0STZu3m9zWcBi4Qs425RpmiFcdgnS91GccgeXduWl4FjrEMIQO11QbNQ6h54WSTnQmsRAhIBia2T47PPPRT9EzPiKwJIOyo5b2LZLTHPuCA7KxuWlRnrAmNNM3CwAoFYl17UZF2_AscGFv4Zugr18iLHvW6uTCNwKFWfLKq8Nk6j7aUzUCqcK1wSW9sboA7E0erCl9MMcO7_yFi01hTd_eDbWJUgFxVnZD-zdYLd_2PFzhsn9t2rUf-1-_mGsoQnAVvMxteE-60sR__msvl2Qx6i3LrCZufyt39vHKJ5N856cAUwLWkz7ubsQkcrC-FZApCh7BoSCSG1Uu237RLQ3oLNfTPcqw4rLxVBu1mfQxkQ9Ez978OnlbzrZQcLU4BVaLIgNNp0qV4cm4_sqhKlL8iUmKnTFniX9WE3R4iO7ZETUMvNerNghGRWVR9Gfv9I42Y8ZmSKDcIIJeK9udtTHpCCSNKVlRpEXnPv0ra_0XLqNSF4Mn6CH54_6bXjJlFpg-dLqoNZD9jipfG9mU4mrwdyR-pdnroiTwPJhLS4l6myJpguTY4E-76cMKYCzra7mIUkaLvqwUFUVTvxm5S6tFJVZ_39gL1EjC3e_ACdCvFFEikle3IAQmEBcJcCaM6Mku43kR84ni5q960fuJHxaKoQ7Gd1HQoRmAA7QhkVS5b0vBjIq_2qZOa=w679-h903-no?authuser=0"),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(),
                ),
              ],
            ),
          ),
        );
}
