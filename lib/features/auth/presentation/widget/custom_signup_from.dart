import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_form_field.dart';
import 'package:dalel/features/auth/presentation/widget/password_text_form_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSccuessState) {
          showToast(msg: "Account Created Successfully");
          customReplacementNavigate(context, '/signIn');
        } else if (state is SignUpFailureState) {
          showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: authCubit.signUpFormKey,
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
                    authCubit.lastName = lastname;
                  },
                ),
                CustomTextFormField(
                  labelText: AppStrings.emailadd,
                  onChanged: (emailadd) {
                    BlocProvider.of<AuthCubit>(context).email = emailadd;
                  },
                ),
                PasswordTextFormField(
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                const TermsAndConditionWidget(),
                const SizedBox(
                  height: 100,
                ),
                state is SignUpLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        color: authCubit.termsAndConditionCurrentState == false
                            ? AppColors.lightgrey
                            : null,
                        text: AppStrings.signup,
                        onPressed: () async {
                          if (authCubit.termsAndConditionCurrentState == true) {
                            if (authCubit.signUpFormKey.currentState!
                                .validate()) {
                              await authCubit.signUpWithEmailAndPassword();
                            }
                          }
                        },
                      ),
              ],
            ));
      },
    );
  }
}
