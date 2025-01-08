import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.onTap});
  final String firstText, secondText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: firstText, style: CustomTextStyle.poppins400style12),
          TextSpan(
              text: secondText,
              style: CustomTextStyle.poppins400style12
                  .copyWith(color: AppColors.lightgrey))
        ])),
      ),
    );
  }
}
