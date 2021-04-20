import 'package:devQuiz/core/app_colors.dart';
import 'package:devQuiz/core/app_images.dart';
import 'package:devQuiz/core/app_text_styles.dart';
import 'package:devQuiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //alinhamento entre os itens de uma coluna
        children: [
          Container(
            height: 40,
            width: 30,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Gereciamento de Estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "3/10",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                  flex: 4, // determina a expansão do componente
                  child: ProgressIndicatorWidget(value: 0.3)),
            ],
          ),
        ],
      ),
    );
  }
}
