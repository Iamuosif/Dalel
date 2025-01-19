import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalSouvinersItem extends StatelessWidget {
  const HistoricalSouvinersItem(
      {super.key, required this.text, required this.image});
  final String text;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 143,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.lightgrey,
                offset: const Offset(1, 5),
                blurRadius: 10)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 96,
              width: 74,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                ),
              )),
          SizedBox(
            height: 36,
            width: 60,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyle.poppins500style16.copyWith(
                color: AppColors.deepbrown,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
