import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_state.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/custom_text_form_field.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSingUpForm extends StatelessWidget {
  const CustomSingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.singupFormKey,
          child: Column(children: [
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
              hintText: AppText.hintPhoneNumber,
              onChanged: (phoneNumber) {
                authCubit.phoneNum = phoneNumber;
              },
            ),
            const SizedBox(height: 24),
            const TermsAndConditions(),
            const SizedBox(height: 60),
            const SizedBox(height: 24),
            CustomBtn(
              text: AppText.continues,
              onPressed: () {
                authCubit.singUpWithPhoneNumber();
              },
            ),
          ]),
        );
      },
    );
  }
}
