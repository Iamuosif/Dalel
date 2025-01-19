import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/widgets/historical_character.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersWidget extends StatelessWidget {
  const HistoricalCharactersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalCharacter(
            text: 'Lionheart', image: AssetImage(Assets.lionHeart)),
        HistoricalCharacter(
            text: 'Napoleon', image: AssetImage(Assets.napoleon)),
        HistoricalCharacter(
            text: 'Saladin', image: AssetImage(Assets.salahAlDin)),
        HistoricalCharacter(
            text: 'Qianlong', image: AssetImage(Assets.qianlong)),
      ],
    );
  }
}
