import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/accountwidget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/login/custom_login_form.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/login/welcome_banner.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(child: WelcomeBanner()),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 29,
        )),
        const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppText.welcome)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: CustomLoginForm()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.center,
            child: AccountTextWidget(
              text1: AppText.member,
              text2: AppText.register,
              onTap: () {
                customNavigate(context, '/singup');
              },
            ),
          ),
        )
      ]),
    );
  }
}
