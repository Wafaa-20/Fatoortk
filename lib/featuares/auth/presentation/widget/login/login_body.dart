import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/account_widget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/login/custom_login_form.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const WelcomeTextWidget(text: AppText.welcome),
        const CustomLoginForm(),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: AccountTextWidget(
            text1: AppText.member,
            text2: AppText.register,
            onTap: () => customReplacementNavigate(context, '/singup'),
          ),
        ),
      ]),
    );
  }
}
