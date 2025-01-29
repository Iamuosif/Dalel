import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_listview.dart';
import 'package:flutter/material.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextHeader(
          text: 'Recommendations',
        ),
        SizedBox(height: 7),
        CustomCategoryListView()
      ],
    );
  }
}
