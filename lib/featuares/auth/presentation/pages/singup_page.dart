import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/accountwidget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/custom_singup_form.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
              const SliverToBoxAdapter(
                child: WelcomeTextWidget(
                    text: AppText.singUp, text2: AppText.createAccount),
              ),
              const SliverToBoxAdapter(child: CustomSingUpForm()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Align(
                    alignment: Alignment.center,
                    child: AccountTextWidget(
                      text1: AppText.haveAccount,
                      text2: AppText.login,
                      onTap: () => customNavigate(context, '/login'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
