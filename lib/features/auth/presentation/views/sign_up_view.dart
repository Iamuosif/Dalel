import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_signup_from.dart';
import 'package:dalel/features/auth/presentation/widget/have_an_acc.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 162,
            ),
          ),
          const SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.welcome)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 18,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomSignUpForm(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                  firstText: AppStrings.haveacc,
                  secondText: AppStrings.signin,
                  onTap: () {
                    customReplacementNavigate(context, '/signIn');
                  })),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          )
        ],
      ),
    ));
  }
}
