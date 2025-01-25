import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/otp/resend_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
          child: PinFieldAutoFill(
            codeLength: 6,
            
            decoration: BoxLooseDecoration(
                gapSpace: 8,
                strokeColorBuilder: const FixedColorBuilder(AppColor.unchecked),
                strokeWidth: 1,
                radius: const Radius.circular(12)),
            onCodeChanged: (code) {
              if (kDebugMode) {
                print("Code Changed: $code");
              } 
            },
          ),
        ),
        const SizedBox(height: 100),
        const ResendCode(),
        const SizedBox(height: 30),
        CustomBtn(text: AppText.continues, onPressed: () {})
      ],
    );
  }
}
