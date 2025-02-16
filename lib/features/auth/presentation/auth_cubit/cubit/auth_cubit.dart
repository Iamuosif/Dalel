import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/profile/data/model/user_profile_model.dart';
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
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  List<UserProfileModel> userProfiles = [];
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
        await addUserProfile(user: response.user!);
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

  void updateTermsAndConditionCurrentState({required newValue}) {
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

  Future<void> resetPassword() async {
    try {
      emit(PasswordResetLoading());
      await supabase.auth.resetPasswordForEmail(email!);
      emit(PasswordResetSuccess());
    } on Exception catch (e) {
      emit(PasswordResetFailure(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile({required supa.User user}) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      debugPrint('No user is currently logged in.');
      return;
    }

    if (firstName!.isEmpty || lastName!.isEmpty || email!.isEmpty) {
      debugPrint('Please fill in all fields.');
      return;
    }

    try {
      // No need to call .execute()
      await supabase.from('user').insert({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'id': user.id,
      });

      debugPrint('⚠️ Inserting user profile for: ${user.id}');
    } catch (e) {
      debugPrint('Error adding user profile: $e');
    }
  }

  Future<UserProfileModel?> fetchUserProfile() async {
    final user = supabase.auth.currentUser; // Get the current user
    if (user == null) {
      debugPrint('No user is currently logged in.');
      return null;
    }

    try {
      // Fetch user data from the 'users' table
      final response = await supabase
          .from('user')
          .select(
              'first_name, email , last_name') // Select only username and email
          .eq('id', user.id) // Match the user ID
          .single(); // Fetch a single record

      return UserProfileModel.fromJson(response);
    } catch (e) {
      debugPrint('Error fetching user profile: $e');
      return null;
    }
  }
}
