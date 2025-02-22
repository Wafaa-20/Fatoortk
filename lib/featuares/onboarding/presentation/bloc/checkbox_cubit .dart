import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxObCubit extends Cubit<List<bool>> {
  final OnboardingOptionsModel optionData;

  CheckboxObCubit(this.optionData)
      : super(List.generate(optionData.option.length, (index) => false));

  void toggleCheckbox(int index) {
    final updatedState = List<bool>.from(state);
    updatedState[index] = !updatedState[index];
    emit(updatedState);
  }
}
