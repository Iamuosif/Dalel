import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.firstText, required this.secondText});
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: firstText, style: CustomTextStyle.poppins400style12),
        TextSpan(
            text: secondText,
            style: CustomTextStyle.poppins400style12
                .copyWith(color: AppColors.lightgrey))
      ])),
    );
  }
}
