import '../../../domain/entities/user_entity.dart';

class AuthState {
  final String email;
  final String password;
  final String confirmPassword;
  final bool isPasswordObscured;
  final bool isLoading;
  final String? error;
  final UserEntity? user;

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordObscured = true,
    this.isLoading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordObscured,
    bool? isLoading,
    String? error,
    UserEntity? user,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
    );
  }
}
