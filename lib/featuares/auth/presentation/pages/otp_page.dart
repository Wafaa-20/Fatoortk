import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/otp/otp_widget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String verificationId =
        args?['verificationId'] ?? ''; 
    final bool isSignUp = args?['isSignUp'] ?? true;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 59)),
            const SliverToBoxAdapter(
                child: Align(
                    alignment: Alignment.center,
                    child: WelcomeTextWidget(
                      text: AppText.enterCode,
                      text2: AppText.digitCode,
                    ))),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
                child: OtpWidget(
              verificationId: verificationId,
              isSignUp: isSignUp,
            )),
          ],
        ),
      )),
    );
  }
}
