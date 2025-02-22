import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final phoneNumperController = TextEditingController();

  @override
  void dispose() {
    phoneNumperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SmsOtpSentState) {
          showToast(
              'Verification code has been sent! You will be redirected to the verification page');
          customReplacementNavigate(context, '/otp', extra: {
            'verificationId': state.verificationId,
            'isSingUp': false,
          });
        } else if (state is AuthFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        AuthBloc authBloc = context.read<AuthBloc>();

        return Form(
          key: authBloc.loginFormKey,
          child: Column(children: [
            CustomTextFormField(
              labelText: AppText.phoneNumber,
              // prefixIcon: const CountryCode(),
              controller: phoneNumperController,
            ),
            const SizedBox(height: 35),
            state is AuthLoading
                ? const CircularProgressIndicator()
                : CustomBtn(
                    text: AppText.login,
                    onPressed: () {
                      if (authBloc.loginFormKey.currentState!.validate()) {
                        // authBloc.add(
                        //   AuthSignInEvent(
                        //       phoneNumber: phoneNumperController.text.trim(),
                        //      ),
                        // );
                      } else {
                        showToast('Please enter a valid phone number');
                      }
                    },
                  ),
          ]),
        );
      },
    );
  }
}
