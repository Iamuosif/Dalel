import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_signin_form.dart';
import 'package:dalel/features/auth/presentation/widget/have_an_acc.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_banner.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcomeback),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomSignIpForm(),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
          )),
          SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                  firstText: AppStrings.donthaveacc,
                  secondText: AppStrings.signup,
                  onTap: () {
                    customReplacementNavigate(context, "/signUp");
                  })),
        ],
      ),
    );
  }
}
