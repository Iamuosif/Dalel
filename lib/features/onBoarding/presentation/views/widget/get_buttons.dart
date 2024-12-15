import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
              text: AppStrings.createacc,
              onPressed: () {
                customNavigateReplacement(context, '/signUp');
              }),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              customNavigateReplacement(context, '/signIn');
            },
            child: Text(
              AppStrings.login,
              style: CustomTextStyle.poppins300style16
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          )
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
              duration: (Duration(milliseconds: 200)), curve: Curves.bounceIn);
        },
      );
    }
  }
}
