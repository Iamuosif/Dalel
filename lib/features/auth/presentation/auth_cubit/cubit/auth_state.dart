import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSccuessState extends AuthState {
  final String userId;

  SignUpSccuessState({required this.userId});
}

final class SignUpLoadingState extends AuthState {
  final String loadingMessage;

  SignUpLoadingState({required this.loadingMessage});
}

final class SignUpFailureState extends AuthState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class SignInSccuessState extends AuthState {
  final User user;

  SignInSccuessState({required this.user});
}

final class SignInLoadingState extends AuthState {
  final String loadingMessage;

  SignInLoadingState({required this.loadingMessage});
}

final class SignInFailureState extends AuthState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
}

class PasswordResetLoading extends AuthState {}

class PasswordResetSuccess extends AuthState {}

class PasswordResetFailure extends AuthState {
  final String errMessage;
  PasswordResetFailure({required this.errMessage});
}

final class TermsAndConditionCurrentState extends AuthState {}
