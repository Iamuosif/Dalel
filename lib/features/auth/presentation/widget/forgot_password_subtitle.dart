import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubtitle extends StatelessWidget {
  const ForgotPasswordSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        AppStrings.enteryouremail,
        style: CustomTextStyle.poppins400style12.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
