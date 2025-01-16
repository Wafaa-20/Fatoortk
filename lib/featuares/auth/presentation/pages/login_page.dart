import 'package:fatoortk/featuares/auth/presentation/widget/login/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(children: [
          LoginBody(),
        ]),
      ),
    );
  }
}
