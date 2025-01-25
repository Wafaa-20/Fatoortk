import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_state.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/country_code.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/custom_text_form_field.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSingUpForm extends StatelessWidget {
  const CustomSingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showToast('Account Created Successfully');
        } else if (state is AuthFailure) {
          showToast(state.errorMessage);
        } else if (state is CodeSent) {
          customNavigate(context, '/otp');
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.singupFormKey,
          child: Column(children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              labelText: AppText.name,
              hintText: AppText.hintName,
              onChanged: (name) {
                authCubit.name = name;
              },
            ),
            CustomTextFormField(
              labelText: AppText.email,
              hintText: AppText.hintEmail,
              onChanged: (email) {
                authCubit.email = email;
              },
            ),
            CustomTextFormField(
              labelText: AppText.phoneNumber,
              prefixIcon: const CountryCode(),
              onChanged: (phoneNumber) {
                authCubit.phoneNum = phoneNumber;
              },
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
                    color: authCubit.termsAndConditionsUpdatedCheckBoxValue ==
                            false
                        ? AppColor.background1
                        : null,
                    onPressed: () {
                      if (authCubit.termsAndConditionsUpdatedCheckBoxValue ==
                          true) {
                        if (authCubit.singupFormKey.currentState!.validate()) {
                          authCubit.singUpWithPhoneNumber();
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
