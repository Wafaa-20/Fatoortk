import 'package:flutter_bloc/flutter_bloc.dart';

class CheckbocCuibt extends Cubit<bool> {
  CheckbocCuibt() : super(false);
  void updateCheckBox(bool value) {
    emit(value);
  }
}
