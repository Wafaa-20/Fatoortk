import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/login/welcome_banner.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: WelcomeBanner()),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 29,
        )),
        SliverToBoxAdapter(
            child: WelcomeTextWidget(
          text: AppText.welcome,
        ))
      ]),
    );
  }
}
