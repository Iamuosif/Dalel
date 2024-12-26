import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? email;
  late String? password;
  late String? firstName;
  late String? lastName;
  Future<void> signUpWithEmailAndPassword() async {
    final supabase = supa.Supabase.instance.client;

    try {
      debugPrint('Attempting to sign up...');
      emit(AuthLoadinState(loadingMessage: 'Signing up...'));
      final response = await supabase.auth.signUp(
        email: email!,
        password: password!,
      );

      if (response.user != null) {
        debugPrint('Sign-up successful:User ID ${response.user!.id}');
        emit(AuthSuccessState(
            userId: 'Sign-up successful! User ID: ${response.user!.id}'));
      } else {
        debugPrint('Sign-up failed: $response');
        emit(AuthFailureState(errMessage: 'Sign-up failed: $response'));
      }
    } catch (error) {
      debugPrint('Error during sign-up: ${error.toString()}');
      emit(AuthFailureState(
          errMessage: 'Error during sign-up: ${error.toString()}'));
    }
  }
}
