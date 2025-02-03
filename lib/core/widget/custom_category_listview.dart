import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/widget/custom_category_listview_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView(
      {super.key, required this.model, required this.routePath});
  final String routePath;
  final List<DataModel> model;

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
              model: model[index],
              routePath: routePath,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: model.length),
    );
  }
}
