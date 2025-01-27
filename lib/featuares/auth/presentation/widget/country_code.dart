// import 'package:country_picker/country_picker.dart';
// import 'package:fatoortk/core/text/text_styles.dart';
// import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
// import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
// import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CountryCode extends StatelessWidget {
//   const CountryCode({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // AuthBloc authCubit = BlocProvider.of<AuthCubit>(context);
//     return InkWell(
//       onTap: () {
//         showCountryPicker(
//           context: context,
//           showPhoneCode: true,
//           onSelect: (Country country) {
//             authCubit.updateSelectedCountryCode(
//               '+${country.phoneCode} ',
//             );
//           },
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.only(left: 15, top: 12.0),
//         child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//           final countryCode = AuthBloc(
//             userSignUp: userSignUp,
//             codeSent: codeSent).countryCode ?? '+966';
//           return Text(
//             countryCode,
//             style: TextStyles.inter15hintText,
//           );
//         }),
//       ),
//     );
//   }
// }
