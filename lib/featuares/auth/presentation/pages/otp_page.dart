import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/otp/otp_widget.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 59)),
            SliverToBoxAdapter(
                child: Align(
                    alignment: Alignment.center,
                    child: WelcomeTextWidget(
                      text: AppText.enterCode,
                      text2: AppText.digitCode,
                    ))),
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
                child: OtpWidget(
              verificationId: '',
            )),
          ],
        ),
      )),
    );
  }
}
