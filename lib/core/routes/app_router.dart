import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/data/models/historical_character_model.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/view/historical_characters_details_view.dart';
import 'package:dalel/features/home/presentation/view/historical_periods_details_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/core/widget/home_nav_bar.dart';
import 'package:dalel/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/persentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/onBoarding',
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/homeNavBar',
    builder: (context, state) => const NavBarWidget(),
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignUpView(),
    ),
  ),
  GoRoute(
    path: '/signIn',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignInView(),
    ),
  ),
  GoRoute(
    path: '/forgotpassword',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgotPasswordView(),
    ),
  ),
  GoRoute(
    path: '/HistoricalPeriodsDetailsView',
    builder: (context, state) => HistoricalPeriodsDetailsView(
      model: state.extra as HistoricalPeriodsModel,
    ),
  ),
  GoRoute(
    path: '/HistoricalCharactersDetailsView',
    builder: (context, state) => HistoricalCharactersDetailsView(
      model: state.extra as HistoricalCharactersModel,
    ),
  ),
]);
