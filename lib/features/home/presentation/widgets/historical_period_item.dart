import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem(
      {super.key, required this.text, required this.image});
  final String text;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 164,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.lightgrey,
              offset: const Offset(1, 5),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 15),
          SizedBox(
            height: 48,
            width: 65,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyle.poppins500style16.copyWith(
                color: AppColors.deepbrown,
              ),
            ),
          ),
          Container(
              height: 64,
              width: 47,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                ),
              )),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
