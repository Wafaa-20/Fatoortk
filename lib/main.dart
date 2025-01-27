import 'package:fatoortk/app.dart';
import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/services/service_locator.dart';
import 'package:fatoortk/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await serviceLocator<CacheHelper>().init();
  checkStateChanges();

  runApp(Fatoortak());
}
