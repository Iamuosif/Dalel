import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PeriodsDetailsSection extends StatelessWidget {
  const PeriodsDetailsSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextHeader(text: '${AppStrings.about} $periodName'),
            const SizedBox(
              width: 6,
            ),
            SvgPicture.asset(Assets.lifeKey),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(top: -64, child: SvgPicture.asset(Assets.pyramids2)),
                SizedBox(
                  height: 220,
                  width: 196,
                  child: Text(
                    description,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.poppins500style16
                        .copyWith(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
                height: 203,
                width: 131,
                child: CachedNetworkImage(imageUrl: imageUrl))
          ],
        ),
      ],
    );
  }
}
