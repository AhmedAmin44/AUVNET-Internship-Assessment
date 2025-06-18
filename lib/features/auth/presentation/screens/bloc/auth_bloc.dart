import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc({required this.loginUseCase, required this.signUpUseCase})
    : super(const AuthState()) {
      // handle email, password, and confirm password changes
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });
     // Handle login submission
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      final result = await loginUseCase(state.email, state.password);

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, error: failure.errMessage));
        },
        (user) {
          final isVerified =
              FirebaseAuth.instance.currentUser?.emailVerified ?? false;
          if (!isVerified) {
            emit(state.copyWith(isLoading: false, error: 'Verify your email.'));
          } else {
            emit(state.copyWith(isLoading: false, user: user));
          }
        },
      );
    });
     // Handle sign-up submission
    on<SignUpSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      if (state.password != state.confirmPassword) {
        emit(
          state.copyWith(isLoading: false, error: 'Passwords do not match.'),
        );
        return;
      }

      final result = await signUpUseCase(
        email: state.email,
        password: state.password,
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, error: failure.errMessage));
        },
        (user) {
          emit(state.copyWith(isLoading: false, user: user));
        },
      );
    });
  }
}
