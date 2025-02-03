import 'package:dalel/core/widget/custom_text_header.dart';
import 'package:dalel/features/bazar/presentation/widget/history_books.dart';
import 'package:flutter/material.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextHeader(text: 'History Books'),
          SizedBox(height: 16),
          HistoryBooks(),
          SizedBox(height: 34),
        ]);
  }
}
