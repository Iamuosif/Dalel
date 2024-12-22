import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/auth/presentation/widget/custom_form_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

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
              child: CustomTextField(
            labelText: AppStrings.firstname,
          )),
          const SliverToBoxAdapter(
              child: CustomTextField(
            labelText: AppStrings.lastname,
          )),
          const SliverToBoxAdapter(
              child: CustomTextField(
            labelText: AppStrings.emailadd,
          )),
          const SliverToBoxAdapter(
              child: CustomTextField(
            labelText: AppStrings.password,
          )),
          const SliverToBoxAdapter(
            child: TermsAndConditionWidget(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomBtn(
              text: AppStrings.signup,
              onPressed: () {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
              child: HaveAnAccountWidget(
            firstText: AppStrings.haveacc,
            secondText: AppStrings.signin,
          ))
        ],
      ),
    ));
  }
}

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.firstText, required this.secondText});
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: firstText, style: CustomTextStyle.poppins400style12),
        TextSpan(
            text: secondText,
            style: CustomTextStyle.poppins400style12
                .copyWith(color: AppColors.lightgrey))
      ])),
    );
  }
}
