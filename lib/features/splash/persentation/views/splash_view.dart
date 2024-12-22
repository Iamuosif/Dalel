import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isonBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isonBoardingVisited') ?? false;
    if (isonBoardingVisited == true) {
      delayedNavigate(context, '/signUp');
    } else {
      delayedNavigate(context, '/onBoarding');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text(AppStrings.appname, style: CustomTextStyle.pacifico400style64),
      ),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(const Duration(seconds: 2), () {
    customReplacementNavigate(context, path);
  });
}
