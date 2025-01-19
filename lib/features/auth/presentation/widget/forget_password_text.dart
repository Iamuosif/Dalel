import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, "/forgotpassword");
      },
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.forgotpass,
            style: CustomTextStyle.poppins600style28.copyWith(fontSize: 12),
          )),
    );
  }
}
