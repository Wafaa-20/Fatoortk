import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_state.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.loginFormKey,
          child: Column(children: [
            CustomTextFormField(
              labelText: AppText.phoneNumber,
              hintText: AppText.hintPhoneNumber,
              onChanged: (phoneNumber) {
                authCubit.phoneNum = phoneNumber;
              },
            ),
            const SizedBox(height: 35),
            CustomBtn(
              text: AppText.login,
              onPressed: () {},
            ),
          ]),
        );
      },
    );
  }
}
