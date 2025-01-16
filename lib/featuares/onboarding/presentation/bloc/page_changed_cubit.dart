import 'package:flutter_bloc/flutter_bloc.dart';

class PageChangedCubit extends Cubit<int>{
  PageChangedCubit():super(0);

  void updatePage(int index)=> emit(index);

}