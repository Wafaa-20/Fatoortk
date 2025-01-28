import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/custom_text_form_field.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/Terms%20And%20Conditions/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSingUpForm extends StatefulWidget {
  const CustomSingUpForm({super.key});

  @override
  State<CustomSingUpForm> createState() => _CustomSingUpFormState();
}

class _CustomSingUpFormState extends State<CustomSingUpForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumperController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SmsOtpSentState) {
          customReplacementNavigate(context, '/otp');
        } else if (state is AuthFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        AuthBloc authBloc = context.read<AuthBloc>();
        return Form(
          key: authBloc.singupFormKey,
          child: Column(children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              labelText: AppText.name,
              hintText: AppText.hintName,
              controller: nameController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: AppText.email,
              hintText: AppText.hintEmail,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: AppText.phoneNumber,
              // prefixIcon: const CountryCode(),
              controller: phoneNumperController,
            ),
            const SizedBox(height: 24),
            const TermsAndConditions(),
            const SizedBox(height: 24),
            state is AuthLoading
                ? const CircularProgressIndicator(
                    color: AppColor.button,
                  )
                : CustomBtn(
                    text: AppText.continues,
                    color: authBloc.checkBoxValue == false
                        ? AppColor.background1
                        : null,
                    onPressed: () {
                      if (authBloc.checkBoxValue == true) {
                        if (authBloc.singupFormKey.currentState!.validate()) {
                          authBloc.add(
                            SendSmsOtpEvent(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phoneNumber: phoneNumperController.text.trim(),
                            ),
                          );
                        }
                      } else {
                        showToast('Please accept the terms and conditions');
                      }
                    },
                  ),
          ]),
        );
      },
    );
  }
}
