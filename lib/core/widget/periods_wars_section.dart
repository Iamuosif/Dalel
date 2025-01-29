import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_data_list_view.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/data/models/wars_model.dart';
import 'package:flutter/material.dart';

class PeriodsWarsSection extends StatelessWidget {
  const PeriodsWarsSection({super.key, required this.warsList});
  final List<WarsModel> warsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader(text: '${AppStrings.ancientEgypt} Wars'),
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
