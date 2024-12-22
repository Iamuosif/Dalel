import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody(
      {super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: PageView.builder(
          onPageChanged: onPageChanged,
          controller: controller,
          itemCount: onBoardingData.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Container(
                  width: 343,
                  height: 290,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(onBoardingData[i].imagepath),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomSmoothPageIndicator(controller: controller),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  onBoardingData[i].title,
                  style: CustomTextStyle.poppins500style24
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  onBoardingData[i].subtitle,
                  style: CustomTextStyle.poppins300style16,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ));
  }
}
