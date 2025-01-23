import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
