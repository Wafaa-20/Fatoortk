import 'package:country_picker/country_picker.dart';
import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          onSelect: (Country country) {
            context.read<AuthBloc>().add(
                  UpdateCountryCodeEvent(
                    countryCode: '+${country.phoneCode} ',
                  ),
                );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 12.0),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          String countryCode = context.watch<AuthBloc>().countryCode;
          if (state is CountryCodeUpdatedState) {
            countryCode = state.countryCode;
          }
          return Text(
            countryCode,
            style: TextStyles.inter15hintText,
          );
        }),
      ),
    );
  }
}
