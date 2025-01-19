import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          showToast(msg: 'Password Reset Email sent , Please check your email');
          customReplacementNavigate(context, '/signIn');
        } else if (state is PasswordResetFailure) {
          showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: authCubit.resetPasswordFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: AppStrings.emailadd,
                    onChanged: (emailadd) {
                      BlocProvider.of<AuthCubit>(context).email = emailadd;
                    },
                  ),
                  const SizedBox(height: 139),
                  state is PasswordResetLoading
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomBtn(
                          text: AppStrings.resetpassword,
                          onPressed: () async {
                            if (authCubit.resetPasswordFormKey.currentState!
                                .validate()) {
                              await authCubit.resetPassword();
                            }
                          },
                        ),
                ],
              )),
        );
      },
    );
  }
}
