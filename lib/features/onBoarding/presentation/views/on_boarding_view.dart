import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/onboarding_widget_body.dart';
import 'package:flutter/material.dart';

import 'widget/custom_nav_bar.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: const [
              SizedBox(
                height: 40,
              ),
              CustomNavBar(),
              OnBoardingWidgetBody(),
              SizedBox(
                height: 88,
              ),
              CustomBtn(
                text: AppStrings.next,
              ),
              SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
