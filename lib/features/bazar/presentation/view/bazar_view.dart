import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/bazar/presentation/widget/custom_floating_action_button.dart';

import 'package:dalel/features/bazar/presentation/widget/history_books_section.dart';
import 'package:dalel/features/bazar/presentation/widget/periods_books_section.dart';
import 'package:dalel/features/bazar/presentation/widget/souvenirs_section.dart';
import 'package:flutter/material.dart';

class BazarView extends StatelessWidget {
  const BazarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.offwhite,
        title: Text(
          'Bazar',
          style: CustomTextStyle.poppins500style24.copyWith(
              color: AppColors.deepbrown, fontWeight: FontWeight.w800),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: PeriodsBooksSection()),
            SliverToBoxAdapter(child: BooksSection()),
            SliverToBoxAdapter(child: SouvenirsSection())
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
