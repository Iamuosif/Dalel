import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/features/onBoarding/presentation/views/functions/onboardingvisited.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/get_buttons.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/onboarding_widget_body.dart';
import 'package:flutter/material.dart';

import 'widget/custom_nav_bar.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController(initialPage: 0);
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomNavBar(
                onTap: () {
                  isonBoardingVisited();
                  customReplacementNavigate(context, '/signUp');
                },
              ),
              OnBoardingWidgetBody(
                onPageChanged: (i) {
                  setState(() {
                    currentpage = i;
                  });
                },
                controller: controller,
              ),
              const SizedBox(
                height: 88,
              ),
              GetButtons(currentIndex: currentpage, controller: controller),
              const SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
