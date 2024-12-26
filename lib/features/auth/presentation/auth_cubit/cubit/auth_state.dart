sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String userId;

  AuthSuccessState({required this.userId});
}

final class AuthLoadinState extends AuthState {
  final String loadingMessage;

  AuthLoadinState({required this.loadingMessage});
}

final class AuthFailureState extends AuthState {
  final String errMessage;

  AuthFailureState({required this.errMessage});
}
