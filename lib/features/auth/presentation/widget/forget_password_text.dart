import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, "path");
      },
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.forgetpass,
            style: CustomTextStyle.poppins600style28.copyWith(fontSize: 12),
          )),
    );
  }
}
