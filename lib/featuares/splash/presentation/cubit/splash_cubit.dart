import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<String> {
  SplashCubit() : super("/onboarding");

  void checkOnboardingStatus() {
    //check if user has completed onboarding
    bool isOnboardingVisited =
        serviceLocator<CacheHelper>().getData(key: "isOnboardingVisited") ?? false;
    //if yes, navigate to login page
    if (isOnboardingVisited) {
      emit('/singup');
      //if no, navigate to onboarding
    } else {
      emit('/onboarding');
    }
  }
}
