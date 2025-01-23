import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

void customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}

void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void checkStateChanges() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });
}
