import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/widget/custom_data_list_view.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:flutter/material.dart';

class PeriodsWarsSection extends StatelessWidget {
  const PeriodsWarsSection(
      {super.key, required this.warsList, required this.eraName});
  final List<DataModel> warsList;
  final String eraName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextHeader(text: '$eraName Wars'),
        const SizedBox(height: 16),
        CustomDataListView(
          dataList: warsList,
          routePath: '/WarsDetails',
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
