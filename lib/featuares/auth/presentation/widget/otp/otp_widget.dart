import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/light_mode.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/otp/resend_code.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
          child: Pinput(
              length: 6,
              defaultPinTheme: LightMode.defaultPinTheme,
              focusedPinTheme: LightMode.focusedPinTheme),
        ),
        const SizedBox(height: 100),
        const ResendCode(),
        const SizedBox(height: 30),
        CustomBtn(
          text: AppText.continues,
          onPressed: () {
            // customReplacementNavigate(context,'/home');
          },
        )
      ],
    );
  }
}
