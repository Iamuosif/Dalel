import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods.dart';
import 'package:flutter/material.dart';

class PeriodsBooksSection extends StatelessWidget {
  const PeriodsBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomTextHeader(text: 'History Books'),
          SizedBox(height: 16),
          HistoricalPeriods(),
          SizedBox(height: 32),
        ]);
  }
}
