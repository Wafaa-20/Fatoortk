import 'package:fatoortk/featuares/auth/presentation/widget/login/login_body.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/login/welcome_banner.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: WelcomeBanner()),
        SliverToBoxAdapter(child: LoginBody()),
      ]),
    );
  }
}
