import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/bloc/checkbox_cubit%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxOnbording extends StatelessWidget {
  const CheckboxOnbording({super.key, required this.data});
    final OnboardingOptionsModel data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: BlocBuilder<CheckboxCubit, List<bool>>(
                builder: (context, isChecked) {
              return ListView.builder(
                itemCount: data.option.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<CheckboxCubit>().toggleCheckbox(index);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isChecked[index]
                              ? AppColor.checked
                              : AppColor.unchecked.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isChecked[index]
                                ? AppColor.checked
                                : AppColor.unchecked,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.option[index],
                              style: TextStyles.subTitel,
                            ),
                            if (isChecked[index])
                              const Icon(Icons.check, color: AppColor.button)
                          ],
                        )),
                  );
                },
              );
            }),
          
          );
  }
}