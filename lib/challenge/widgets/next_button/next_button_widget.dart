import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
  }) : super(key: key);

  NextButtonWidget.green({required String label}) // contrutor nomeado
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label;

  NextButtonWidget.white({required String label}) // contrutor nomeado
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            )),
        onPressed: () {},
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
