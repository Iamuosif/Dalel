import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/widget/custom_data_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({
    super.key,
    required this.dataList,
    required this.routePath,
  });

  final String routePath;
  final List<DataModel> dataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return CustomDataListViewItem(
            model: dataList[index],
            routePath: routePath,
          );
        },
      ),
    );
  }
}
