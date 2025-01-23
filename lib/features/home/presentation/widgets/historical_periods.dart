import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widget/custom_shimmer_category.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HistoricalPeriodsFaliure) {
          showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return state is HistoricalPeriodsLoading
            ? const CustomShimmerCategory()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount:
                      context.read<HomeCubit>().historicalPeriodsModel.length,
                  itemBuilder: (context, index) {
                    return HistoricalPeriodItem(
                        model: context
                            .read<HomeCubit>()
                            .historicalPeriodsModel[index]);
                  },
                ),
              );
      },
    );
  }
}
