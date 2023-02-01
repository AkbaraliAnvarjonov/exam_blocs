import 'package:fifth_exam/app/app.dart';
import 'package:fifth_exam/app/bloc_observer.dart';
import 'package:fifth_exam/data/my_locale/my_locale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("news");
  Bloc.observer = AppBlocObserver();
  setUp();
  runApp(const App());
}
