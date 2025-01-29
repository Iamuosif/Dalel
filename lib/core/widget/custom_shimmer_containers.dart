import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerContainers extends StatelessWidget {
  const CustomShimmerContainers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Shimmer.fromColors(
              baseColor: AppColors.lightgrey,
              highlightColor: Colors.white,
              child: Container(
                width: 74,
                height: 133,
                decoration: BoxDecoration(
                  color: AppColors.deepgrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
        const SizedBox(width: 16),
        SizedBox(
          child: Shimmer.fromColors(
              baseColor: AppColors.lightgrey,
              highlightColor: AppColors.deepgrey,
              child: Container(
                width: 74,
                height: 133,
                decoration: BoxDecoration(
                  color: AppColors.deepgrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
        const SizedBox(width: 16),
        SizedBox(
          child: Shimmer.fromColors(
              baseColor: AppColors.lightgrey,
              highlightColor: Colors.white,
              child: Container(
                width: 74,
                height: 133,
                decoration: BoxDecoration(
                  color: AppColors.deepgrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
        const SizedBox(width: 16),
        SizedBox(
          child: Shimmer.fromColors(
              baseColor: AppColors.lightgrey,
              highlightColor: AppColors.deepgrey,
              child: Container(
                width: 74,
                height: 133,
                decoration: BoxDecoration(
                  color: AppColors.deepgrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
      ],
    );
  }
}
