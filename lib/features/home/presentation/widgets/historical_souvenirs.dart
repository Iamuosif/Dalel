import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widget/custom_category_listview.dart';
import 'package:dalel/core/widget/custom_shimmer_containers.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalSouvenirs extends StatelessWidget {
  const HistoricalSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HistoricalSouvenirsFailiure) {
          showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return state is HistoricalSouvenirsLoading
            ? const CustomShimmerContainers()
            : CustomCategoryListView(
                model: context.read<HomeCubit>().souvenirsList,
              );
      },
    );
  }
}
