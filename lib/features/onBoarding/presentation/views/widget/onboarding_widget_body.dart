import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/onBoarding/presentation/views/widget/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SizedBox(
        height: 500,
        child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 343,
                  height: 290,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.imagesOnBoarding),
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
                  'Explore The history with Dalel in smart way',
                  style: CustomTextStyle.poppins500style24
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
