import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/featuares/auth/data/data%20sources/auth_remot_data_source.dart';
import 'package:fatoortk/featuares/auth/data/repository/auth_repository_iml.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/current_user.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/sms_otp.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_in.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_up.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/verify_sms_otp.dart';
import 'package:fatoortk/featuares/auth/presentation/bloc/auth%20bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemotDataSource>(
    () => AuthRemotDataSourceImpl(
      firebaseAuth: serviceLocator(),
      firebaseFirestore: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        remotDataSource: serviceLocator(),
      ));
  serviceLocator.registerFactory(() => VerifySmsOtp(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => UserSignUp(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => UserSignIn(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => SmsOtp(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => CurrentUser(
        serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => AuthBloc(
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
        smsOtp: serviceLocator(),
        verifySmsOtp: serviceLocator(),
        currentUser: serviceLocator(),
      ));
}

void setupServiceLocator() {
  serviceLocator.registerSingleton<CacheHelper>(CacheHelper());
}
