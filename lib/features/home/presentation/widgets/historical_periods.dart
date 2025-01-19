import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(
          text: 'Ancinet Egypt',
          image: AssetImage(Assets.pyramids),
        ),
        HistoricalPeriodItem(
          text: 'Islamic Era',
          image: AssetImage(Assets.islamicEra),
        ),
      ],
    );
  }
}
