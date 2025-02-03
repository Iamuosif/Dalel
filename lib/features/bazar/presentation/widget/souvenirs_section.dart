import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/bazar/presentation/widget/souvenirs.dart';
import 'package:flutter/material.dart';

class SouvenirsSection extends StatelessWidget {
  const SouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextHeader(text: 'Historical Souvenirs'),
          SizedBox(height: 20),
          Souvenirs(),
          SizedBox(height: 35),
        ]);
  }
}
