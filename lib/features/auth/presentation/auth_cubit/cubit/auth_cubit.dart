import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  bool? termsAndConditionCurrentState = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  final supabase = supa.Supabase.instance.client;
  Future<void> signUpWithEmailAndPassword() async {
    if (email == null || password == null) {
      debugPrint('Email or password is null.');
      emit(SignUpFailureState(errMessage: 'Email or password cannot be null.'));
      return;
    }

    try {
      debugPrint('Attempting to sign up...');
      emit(SignUpLoadingState(loadingMessage: 'Signing up...'));
      final response = await supabase.auth.signUp(
        email: email!,
        password: password!,
      );

      if (response.user != null) {
        debugPrint('Sign-up successful: User ID ${response.user!.id}');
        emit(SignUpSccuessState(userId: response.user!.id));
      } else {
        debugPrint('Sign-up failed: No user returned.');
        emit(SignUpFailureState(
            errMessage: 'Sign-up failed: No user returned.'));
      }
    } catch (error) {
      debugPrint('Error during sign-up: ${error.toString()}');
      if (error is supa.AuthException &&
          error.message.contains('already registered')) {
        debugPrint('Email is already registered.');
        emit(SignUpFailureState(errMessage: 'Email is already registered.'));
      } else {
        emit(SignUpFailureState(
            errMessage: 'Error during sign-up: ${error.toString()}'));
      }
    }
  }

  updateTermsAndConditionCurrentState({required newValue}) {
    termsAndConditionCurrentState = newValue;
    emit(TermsAndConditionCurrentState());
  }

  Future<void> signInwithEmailAndPassword() async {
    emit(SignInLoadingState(
        loadingMessage: 'Signing In.....')); // Set state to loading

    try {
      // Attempt to sign in
      final supa.AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password!,
      );

      // If successful, emit AuthSuccess with the user
      emit(SignInSccuessState(user: response.user!));
      debugPrint('Sign-in successful: ${(response.user!.email)}');
    } on supa.AuthException catch (e) {
      // Handle authentication errors
      if (e.code! == 'not_found') {
        emit(SignInFailureState(errMessage: 'errMessage: User not found'));
        debugPrint('User not found');
      } else if (e.code! == 'invalid_password') {
        emit(SignInFailureState(errMessage: "errMessage: Invalid password"));
        debugPrint('Invalid password');
      }
      emit(SignInFailureState(errMessage: e.message));
      debugPrint('Check your email and password.');
    } catch (e) {
      // Handle all other errors
      emit(SignInFailureState(errMessage: 'An unexpected error occurred: $e'));
    }
  }
}
