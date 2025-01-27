import 'package:fatoortk/core/routes/app_router.dart';
import 'package:fatoortk/core/services/service_locator.dart';
import 'package:fatoortk/core/theme/light_mode.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fatoortak extends StatelessWidget {
  Fatoortak({super.key});
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    initDependencies();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: LightMode.lightMode,
        routerConfig: router,
      ),
    );
  }
}
