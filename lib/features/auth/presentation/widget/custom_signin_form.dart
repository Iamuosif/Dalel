import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widget/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_form_field.dart';
import 'package:dalel/features/auth/presentation/widget/forget_password_text.dart';
import 'package:dalel/features/auth/presentation/widget/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSccuessState) {
          showToast(msg: "Welcome Back!");
          customReplacementNavigate(context, '/home');
        } else if (state is SignInFailureState) {
          showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: authCubit.signInFormKey,
            child: Column(
              children: [
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
                const SizedBox(height: 16),
                const ForgotPasswordTextWidget(),
                const SizedBox(height: 150),
                state is SignInLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        text: AppStrings.signin,
                        onPressed: () async {
                          if (authCubit.signInFormKey.currentState!
                              .validate()) {
                            await authCubit.signInwithEmailAndPassword();
                          }
                        },
                      ),
              ],
            ));
      },
    );
  }
}
