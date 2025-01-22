import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_listview.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextHeader(text: AppStrings.historicalCharacters),
        SizedBox(height: 16),
        CustomCategoryListView(),
        SizedBox(height: 32)
      ],
    );
  }
}
