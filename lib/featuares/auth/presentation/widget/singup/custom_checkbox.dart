import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/checkboc_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckbocCuibt(),
      child: BlocBuilder<CheckbocCuibt, bool>(
        builder: (context, state) {
          return Checkbox(
            value: state,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: const BorderSide(
              color: AppColor.unchecked,
              width: 1.5,
            ),
            onChanged: (bool? value) {
              context.read<CheckbocCuibt>().updateCheckBox(value!);
            },
          );
        },
      ),
    );
  }
}
