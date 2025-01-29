import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souvenirs.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextHeader(text: AppStrings.historicalSouvenirs),
        SizedBox(height: 16),
        HistoricalSouvenirs(),
        SizedBox(height: 32),
      ],
    );
  }
}
