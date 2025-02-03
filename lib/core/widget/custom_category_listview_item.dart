import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem(
      {super.key, required this.model, required this.routePath});
  final DataModel model;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routePath, extra: model);
      },
      child: Container(
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
            SizedBox(
                child: SizedBox(
              height: 96,
              width: 74,
              child: CachedNetworkImage(imageUrl: model.image),
            )),
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                model.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
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
      ),
    );
  }
}
