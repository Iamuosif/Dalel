import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalCharactersDetails extends StatelessWidget {
  const HistoricalCharactersDetails({
    super.key,
    required this.charName,
    required this.description,
    required this.imageUrl,
  });
  final String charName;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    bool salahAlDin = charName == 'Saladin';
    return Column(
      children: [
        Row(
          children: [
            CustomTextHeader(text: '${AppStrings.about} $charName'),
            const SizedBox(
              width: 6,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 219,
                  width: 196,
                  child: Stack(children: [
                    SvgPicture.asset(Assets.bigCircle),
                    Positioned(
                        left: 40,
                        top: 1,
                        child: SvgPicture.asset(Assets.smallCircle)),
                    Text(
                      description,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.poppins500style16
                          .copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
                height: 240,
                child: salahAlDin
                    ? Stack(
                        children: [
                          Positioned(
                              top: -7,
                              right: -2,
                              child: SvgPicture.asset(Assets.eagle)),
                          Positioned(
                            bottom: 20,
                            right: -1,
                            child: SizedBox(
                              child: SvgPicture.asset(Assets.shape),
                            ),
                          ),
                          Positioned(
                            child: SizedBox(
                                height: 260,
                                child: Image.asset(Assets.salahAlDin2)),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: 131,
                        height: 201,
                        child: CachedNetworkImage(imageUrl: imageUrl)))
          ],
        ),
      ],
    );
  }
}
