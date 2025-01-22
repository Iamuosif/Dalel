import 'package:dalel/features/home/presentation/widgets/historical_characters_section.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souvenirs_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeAppBarSection()),
          SliverToBoxAdapter(child: HistoricalPeriodsSection()),
          SliverToBoxAdapter(child: HistoricalCharactersSection()),
          SliverToBoxAdapter(child: HistoricalSouvenirsSection())
        ],
      ),
    ));
  }
}
