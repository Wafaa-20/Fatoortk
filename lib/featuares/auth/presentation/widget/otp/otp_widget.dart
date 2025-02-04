// import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/light_mode.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/otp/resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget(
      {super.key, required this.verificationId, required this.isSignUp});
  final String verificationId;
  final bool? isSignUp;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final otpController = TextEditingController();
  final otpFocusNode = FocusNode();

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSignUp = widget.isSignUp ?? true;

    final AuthBloc authBloc = context.read<AuthBloc>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SmsOtpVerifiedState) {
          if (isSignUp) {
            authBloc.add(AuthSignUpEvent(
              name: authBloc.cachedName ?? "",
              email: authBloc.cachedEmail ?? "",
              phoneNumber: authBloc.cachedPhoneNumber ?? "",
              smsCode: otpController.text.trim(),
              verificationId: widget.verificationId,
            ));
          } else {
            authBloc.add(
              AuthSignInEvent(
                id: widget.verificationId,
                phoneNumber: authBloc.cachedPhoneNumber ?? "",
                smsCode: otpController.text.trim(),
              ),
            );
          }
        } else if (state is AuthSuccess) {
          customReplacementNavigate(context, '/home');
        } else if (state is AuthFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 10, right: 10),
              child: Pinput(
                controller: otpController,
                focusNode: otpFocusNode,
                length: 6,
                defaultPinTheme: LightMode.defaultPinTheme,
                focusedPinTheme: LightMode.focusedPinTheme,
              ),
            ),
            const SizedBox(height: 100),
            const ResendCode(),
            const SizedBox(height: 30),
            CustomBtn(
              text: AppText.continues,
              onPressed: () {
                String otpCode = otpController.text.trim();

                if (otpCode.isNotEmpty && otpCode.length == 6) {
                  if (widget.verificationId.isNotEmpty) {
                    authBloc.add(
                      VerifySmsOtpEvent(
                        verificationId: widget.verificationId,
                        smsCode: otpCode,
                      ),
                    );
                  } else {
                    showToast('Error: Verification ID is missing.');
                  }
                } else {
                  showToast('Please enter a valid OTP');
                }
              },
            )
          ],
        );
      },
    );
  }
}
