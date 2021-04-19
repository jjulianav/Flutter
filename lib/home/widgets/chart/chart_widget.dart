import 'package:devQuiz/core/app_colors.dart';
import 'package:devQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        // fazer uma enpilhamento
        children: [
          Center(
            child: Container(
              child: Container(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: 0.75,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
          ),
          Center(
              child: Text(
            "75%",
            style: AppTextStyles.heading,
          ))
        ],
      ),
    );
  }
}
