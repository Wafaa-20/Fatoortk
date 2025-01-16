import 'package:fatoortk/featuares/auth/presentation/pages/login_page.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/singup_page.dart';
import 'package:fatoortk/featuares/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: "/singUp",
    builder: (context, state) => const SingupPage(),
  )
]);
