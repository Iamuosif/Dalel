import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_form_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            CustomTextFormField(
              labelText: AppStrings.firstname,
              onChanged: (firstname) {
                BlocProvider.of<AuthCubit>(context).firstName = firstname;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.lastname,
              onChanged: (lastname) {
                BlocProvider.of<AuthCubit>(context).lastName = lastname;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.emailadd,
              onChanged: (emailadd) {
                BlocProvider.of<AuthCubit>(context).email = emailadd;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.password,
              onChanged: (password) {
                BlocProvider.of<AuthCubit>(context).password = password;
              },
            ),
            const TermsAndConditionWidget(),
            const SizedBox(
              height: 100,
            ),
            CustomBtn(
              text: AppStrings.signup,
              onPressed: () {
                BlocProvider.of<AuthCubit>(context)
                    .signUpWithEmailAndPassword();
              },
            ),
          ],
        ));
      },
    );
  }
}
