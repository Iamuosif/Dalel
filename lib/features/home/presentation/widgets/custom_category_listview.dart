import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_listview_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatefulWidget {
  const CustomCategoryListView({super.key});

  @override
  State<CustomCategoryListView> createState() => _CustomCategoryListViewState();
}

class _CustomCategoryListViewState extends State<CustomCategoryListView> {
  List characters = [
    'Lionheart',
    'Napeleon',
    'Saldin',
    'Qianlomg',
  ];
  List<ImageProvider> images = [
    const AssetImage(Assets.lionHeart),
    const AssetImage(Assets.napoleon),
    const AssetImage(Assets.salahAlDin),
    const AssetImage(Assets.qianlong),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomCategoryListViewItem(
              name: characters[index],
              image: images[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: characters.length),
    );
  }
}
