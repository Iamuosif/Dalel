import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souviner_item.dart';
import 'package:flutter/material.dart';

class HistoricalSouviners extends StatelessWidget {
  const HistoricalSouviners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalSouvinersItem(
            text: 'Old Books', image: AssetImage(Assets.oldBooks)),
        HistoricalSouvinersItem(
            text: 'Puzzels', image: AssetImage(Assets.puzzels)),
        HistoricalSouvinersItem(
            text: 'Old Stuff', image: AssetImage(Assets.oldStuff)),
        HistoricalSouvinersItem(
            text: 'Old Clothes', image: AssetImage(Assets.oldClothes)),
      ],
    );
  }
}
