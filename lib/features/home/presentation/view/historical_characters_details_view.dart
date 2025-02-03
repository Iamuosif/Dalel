import 'package:dalel/core/widget/historical_characters_details.dart';
import 'package:dalel/core/widget/periods_wars_section.dart';

import 'package:dalel/features/home/data/models/historical_character_model.dart';

import 'package:dalel/features/home/presentation/widgets/home_appbar_section.dart';
import 'package:dalel/features/home/presentation/widgets/recommendation_section.dart';

import 'package:flutter/material.dart';

class HistoricalCharactersDetailsView extends StatelessWidget {
  const HistoricalCharactersDetailsView({
    super.key,
    required this.model,
  });
  final HistoricalCharactersModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          SliverToBoxAdapter(
              child: HistoricalCharactersDetails(
            charName: model.name,
            description: model.description,
            imageUrl: model.image,
          )),
          SliverToBoxAdapter(
              child: PeriodsWarsSection(
                  warsList: model.wars, eraName: model.name)),
          const SliverToBoxAdapter(child: RecommendationsSection())
        ],
      ),
    ));
  }
}
