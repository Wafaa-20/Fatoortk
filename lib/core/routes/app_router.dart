import 'package:fatoortk/featuares/auth/presentation/pages/login_page.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/otp_page.dart';
import 'package:fatoortk/featuares/auth/presentation/pages/signup_page.dart';
import 'package:fatoortk/featuares/home/presentation/pages/home_page.dart';
import 'package:fatoortk/featuares/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:fatoortk/featuares/splash/presentation/page/splash_screen.dart';
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
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: "/singUp",
    builder: (context, state) => const SingupPage(),
  ),
  GoRoute(
    path: "/otp",
    builder: (context, state) => const OtpPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  ),
]);
