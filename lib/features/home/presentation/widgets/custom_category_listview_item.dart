import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem(
      {super.key, required this.name, required this.image});
  final String name;
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
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: image, fit: BoxFit.fill),
              )),
          SizedBox(
            height: 20,
            width: 70,
            child: Text(
              name,
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
