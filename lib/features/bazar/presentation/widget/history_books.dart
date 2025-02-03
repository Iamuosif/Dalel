import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widget/custom_category_listview.dart';
import 'package:dalel/core/widget/custom_shimmer_containers.dart';
import 'package:dalel/features/bazar/presentation/cubit/bazar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBooks extends StatelessWidget {
  const HistoryBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BazarCubit, BazarState>(
      listener: (context, state) {
        if (state is HistoricalBooksFailure) {
          showToast(msg: state.errMessage);
          debugPrint('Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return state is HistoricalBooksLoading
            ? const CustomShimmerContainers()
            : CustomCategoryListView(
                model: context.read<BazarCubit>().booksList,
                routePath: '/HistoricalBooksDetailsView',
              );
      },
    );
  }
}
