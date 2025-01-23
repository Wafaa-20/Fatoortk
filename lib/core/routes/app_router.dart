import 'package:fatoortk/core/services/service_locator.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/login_page.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/otp_page.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/singup_page.dart';
import 'package:fatoortk/featuares/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:fatoortk/featuares/splash/presentation/page/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/onboarding',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const LoginPage(),
    ),
  ),
  GoRoute(
    path: "/singUp",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const SingupPage(),
    ),
  ),
  GoRoute(
    path: "/otp",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const OtpPage(),
    ),
  )
]);
