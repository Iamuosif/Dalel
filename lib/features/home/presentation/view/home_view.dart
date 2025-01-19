import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/home/presentation/widgets/historical_characters_widget.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souviners.dart';
import 'package:dalel/features/home/presentation/widgets/home_app_bar_widget.dart';
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
          SliverToBoxAdapter(child: SizedBox(height: 74)),
          SliverToBoxAdapter(child: HomeAppBarWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
              child: CustomTextHeader(text: AppStrings.historicalPeriods)),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(child: HistoricalPeriods()),
          SliverToBoxAdapter(child: SizedBox(height: 38)),
          SliverToBoxAdapter(
              child: CustomTextHeader(text: AppStrings.historicalCharacters)),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(child: HistoricalCharactersWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 38)),
          SliverToBoxAdapter(
              child: CustomTextHeader(text: AppStrings.historicalSouvenirs)),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(
            child: HistoricalSouviners(),
          )
        ],
      ),
    ));
  }
}
