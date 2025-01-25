import 'package:fatoortk/core/functions/custom_toast.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_state.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/country_code.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CodeSent) {
          showToast(
              'Verification code has been sent! You will be redirected to the verification page');
          customNavigate(context, '/otp');
        } else if (state is AuthFailure) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.loginFormKey,
          child: Column(children: [
            CustomTextFormField(
              labelText: AppText.phoneNumber,
              prefixIcon: const CountryCode(),
              onChanged: (phoneNumber) {
                authCubit.phoneNum = phoneNumber;
              },
            ),
            const SizedBox(height: 35),
            state is AuthLoading
                ? const CircularProgressIndicator()
                : CustomBtn(
                    text: AppText.login,
                    onPressed: () {
                      if (authCubit.loginFormKey.currentState!.validate()) {
                        authCubit.singUpWithPhoneNumber();
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
