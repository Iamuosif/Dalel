import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widget/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CheckBoxWidget(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: AppStrings.ihaveagreetoour,
              style: CustomTextStyle.poppins400style12),
          TextSpan(
              text: AppStrings.termsandcondition,
              style: CustomTextStyle.poppins400style12
                  .copyWith(decoration: TextDecoration.underline))
        ]))
      ],
    );
  }
}
