import 'package:fifth_exam/app/app.dart';
import 'package:fifth_exam/app/bloc_observer.dart';
import 'package:fifth_exam/data/local_database/local_db.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/data/my_locale/my_locale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await LocalDatabase.insertNotification(
      breakingNews: BreakingNews(
          newsTitle: message.data["newsTitle"],
          dateTime: DateTime.now().toString(),
          description: message.data["description"],
          newsImage: message.data["newsImage"]));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("news");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await LocalDatabase.insertNotification(
        breakingNews: BreakingNews(
            newsTitle: message.data["newsTitle"],
            dateTime: DateTime.now().toString(),
            description: message.data["description"],
            newsImage: message.data["newsImage"]));
  });

  Bloc.observer = AppBlocObserver();
  setUp();
  runApp(const App());
}
