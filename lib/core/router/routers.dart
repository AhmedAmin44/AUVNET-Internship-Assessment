import 'package:auvnet_internship_assessment/core/connection/network_info.dart';
import 'package:auvnet_internship_assessment/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/auth/domain/usecases/login_usecase.dart';
import 'package:auvnet_internship_assessment/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/log_in_screen.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/home_screen.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:auvnet_internship_assessment/features/splash/presentation/splash_screen.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final authRepository = AuthRepositoryImpl(
  remoteDataSource: AuthRemoteDataSourceImpl(FirebaseAuth.instance),
  networkInfo: NetworkInfoImpl(DataConnectionChecker()),
);
final loginUseCase = LoginUseCase(authRepository);
final signUpUseCase = SignUpUseCase(authRepository);
final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) {
        return BlocProvider(
          create:
              (_) => AuthBloc(
                loginUseCase: loginUseCase,
                signUpUseCase: signUpUseCase,
              ),
          child: const LogInScreen(),
        );
      },
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) {
        return BlocProvider(
          create:
              (_) => AuthBloc(
                loginUseCase: loginUseCase,
                signUpUseCase: signUpUseCase,
              ),
          child: const SignUpScreen(),
        );
      },
    ),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
  ],
);
