import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/featuares/splash/presentation/cubit/splash_cubit.dart';
import 'package:fatoortk/featuares/splash/presentation/widget/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background1,
        body: BlocProvider(
          create: (context) {
            final cubit = SplashCubit();
            Future.delayed(
              const Duration(seconds: 2),
              () => cubit.checkOnboardingStatus(),
            );
            return cubit;
          },
          child: BlocListener<SplashCubit, String>(
            listener: (context, state) {
              customReplacementNavigate(context, state);
            },
            child: const Center(
              child: SplashBody(),
            ),
          ),
        ),
      ),
    );
  }
}
