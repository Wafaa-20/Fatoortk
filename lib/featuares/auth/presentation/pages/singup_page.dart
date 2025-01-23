import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/accountwidget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/custom_singup_form.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: WelcomeTextWidget(
                    text: AppText.singUp, text2: AppText.createAccount),
              ),
              SliverToBoxAdapter(child: CustomSingUpForm()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Align(
                    alignment: Alignment.center,
                    child: AccountWidget(
                        text1: AppText.haveAccount, text2: AppText.login)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
