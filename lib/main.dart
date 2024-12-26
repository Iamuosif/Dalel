import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/check_current_user_state.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
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
  runApp(const Dalel());
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
