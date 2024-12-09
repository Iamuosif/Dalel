import 'package:dalel/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/persentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/onBoarding',
    builder: (context, state) => const OnBoardingView(),
  )
]);
