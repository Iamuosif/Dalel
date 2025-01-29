import 'package:dalel/core/widget/periods_details_section.dart';
import 'package:dalel/core/widget/periods_wars_section.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar_section.dart';
import 'package:dalel/features/home/presentation/widgets/recommendations_section.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          SliverToBoxAdapter(
              child: PeriodsDetailsSection(
            periodName: model.name,
            description: model.description,
            imageUrl: model.image,
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),
          SliverToBoxAdapter(child: PeriodsWarsSection(warsList: model.wars)),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child: RecommendationsSection()),
        ],
      ),
    ));
  }
}
