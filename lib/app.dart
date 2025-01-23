import 'package:fatoortk/core/routes/app_router.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class Fatoortak extends StatelessWidget {
  const Fatoortak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColor.background2),
      routerConfig: router,
    );
  }
}
