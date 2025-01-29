import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/view/cart_view.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/view/profile_view.dart';
import 'package:dalel/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          colorBehindNavBar: Colors.white),
      navBarStyle: NavBarStyle.style6,
      backgroundColor: AppColors.primaryColor,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()
        ..getHistoricalPeriods()
        ..getHistoricalCharacters()
        ..getHistoricalSouvenirs(),
      child: const HomeView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView()
  ];
}

List<PersistentBottomNavBarItem> _navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.activeHome),
      inactiveIcon: SvgPicture.asset(Assets.inActiveHome),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.activeCart),
      inactiveIcon: SvgPicture.asset(Assets.inActiveCart),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.activeSearch),
      inactiveIcon: SvgPicture.asset(Assets.inActiveSearch),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.activePerson),
      inactiveIcon: SvgPicture.asset(Assets.inActivePerson),
    ),
  ];
}
