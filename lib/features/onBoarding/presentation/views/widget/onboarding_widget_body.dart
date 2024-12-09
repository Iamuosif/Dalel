import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return Expanded(
        child: PageView.builder(
      controller: _controller,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(Assets.imagesOnBoarding),
            SizedBox(
              height: 24,
            ),
            CustomSmoothPageIndicator(controller: _controller),
            SizedBox(
              height: 32,
            ),
            Text(
              'Explore The history with Dalel in smart way',
              style: CustomTextStyle.poppins500style24,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Using our app’s history libraries you can find many historical periods',
              style: CustomTextStyle.poppins300style16,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    ));
  }
}
