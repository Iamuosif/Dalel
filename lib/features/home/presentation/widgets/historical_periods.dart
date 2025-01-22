import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: Supabase.instance.client.from('historical_periods').select(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          if (snapshot.hasData) {
            List<HistoricalPeriodsModel> historicalPeriods = [];
            for (int i = 0; i < snapshot.data!.length; i++) {
              historicalPeriods
                  .add(HistoricalPeriodsModel.fromJson(snapshot.data![i]));
            }
            return SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return HistoricalPeriodItem(model: historicalPeriods[index]);
                },
              ),
            );
          }
          return const Text('Error');
        });
  }
}
