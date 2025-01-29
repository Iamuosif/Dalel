import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
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
                model.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CustomTextStyle.poppins500style16.copyWith(
                  color: AppColors.deepbrown,
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 47,
              child: CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.lightgrey,
                    highlightColor: Colors.white,
                    child: Container(
                        height: 64, width: 47, color: AppColors.lightgrey)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
