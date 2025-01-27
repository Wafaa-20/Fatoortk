import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        AuthBloc authBloc = context.read<AuthBloc>();
        return Checkbox(
          value: authBloc.checkBoxValue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: const BorderSide(
            color: AppColor.unchecked,
            width: 1.5,
          ),
          onChanged: (bool? value) {
            authBloc.add(UpdateTermsAndConditionsCheckboxEvent(value!));
          },
        );
      },
    );
  }
}

// class CustomCheckbox extends StatelessWidget {
//   const CustomCheckbox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//       AuthBloc authBloc = context.read<AuthBloc>();
//       return Checkbox(
//         value: authBloc.checkBoxValue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6),
//         ),
//         side: const BorderSide(
//           color: AppColor.unchecked,
//           width: 1.5,
//         ),
//         onChanged: (bool? value) {
//           authBloc.add(UpdateTermsAndConditionsCheckboxEvent(value!));
//         },
//       );
//     });
//   }
// }
