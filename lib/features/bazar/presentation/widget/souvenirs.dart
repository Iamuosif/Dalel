import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widget/custom_category_listview.dart';
import 'package:dalel/core/widget/custom_shimmer_containers.dart';
import 'package:dalel/features/bazar/presentation/cubit/bazar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Souvenirs extends StatelessWidget {
  const Souvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BazarCubit, BazarState>(
      listener: (context, state) {
        if (state is SouvenirsFailure) {
          showToast(msg: state.errMessage);
          debugPrint('Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return state is SouvenirsLoading
            ? const CustomShimmerContainers()
            : CustomCategoryListView(
                model: context.read<BazarCubit>().souvenirsList,
                routePath: '/souvenirsDetailsView',
              );
      },
    );
  }
}
