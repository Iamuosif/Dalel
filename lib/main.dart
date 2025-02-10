import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/check_current_user_state.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/bazar/presentation/cubit/bazar_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppStrings.supaBaseUrl,
    anonKey: AppStrings.supaBaseUnonKey,
  );
  checkCurrentUserState();

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHistoricalPeriods()
              ..getHistoricalCharacters()
              ..getHistoricalSouvenirs()),
        BlocProvider(
            create: (context) => BazarCubit()
              ..getHistoricalBooks()
              ..getSouvenirs()),
        BlocProvider(
          create: (context) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            final bazarCubit = BlocProvider.of<BazarCubit>(context);
            return SearchCubit(homeCubit, bazarCubit);
          },
        )
      ],
      child: const Dalel(),
    ),
  );
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offwhite),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
