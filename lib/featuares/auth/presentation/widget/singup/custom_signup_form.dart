import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/core/widgets/loader.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/country_code.dart';
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
  final phoneNumberController = TextEditingController();
  bool isUserExist = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserExistState) {
          showToast(
              'This user already exists. Please login or enter another phone number.');
        }
        if (state is SmsOtpSentState) {
          customReplacementNavigate(context, '/otp', extra: {
            'verificationId': state.verificationId,
            'isSingUp': true,
          });
        } else if (state is AuthFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        AuthBloc authBloc = context.read<AuthBloc>();
        String countryCode = authBloc.countryCode;

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
              prefixIcon: const CountryCode(),
              controller: phoneNumberController,
              onChanged: (value) {
                if (value.length == 10) {
                  authBloc.add(
                    CheckUserEvent(
                      field: 'phoneNumber',
                      value: "$countryCode$value",
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            const TermsAndConditions(),
            const SizedBox(height: 24),
            state is AuthLoading
                ? const Loader()
                : CustomBtn(
                    text: AppText.continues,
                    color: authBloc.checkBoxValue == false
                        ? AppColor.background1
                        : null,
                    onPressed: () {
                      if (authBloc.checkBoxValue == true) {
                        if (authBloc.singupFormKey.currentState!.validate()) {
                          String phoneNumber =
                              phoneNumberController.text.trim();
                          authBloc.add(
                            CacheUserDataEvent(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phoneNumber: phoneNumber,
                            ),
                          );
                          authBloc.add(
                            SendSmsOtpEvent(
                              phoneNumber: "$countryCode$phoneNumber",
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
