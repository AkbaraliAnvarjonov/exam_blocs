import 'package:fifth_exam/data/local_database/local_db.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';

class NotificationRepository {
  Future<BreakingNews> addNotification({required BreakingNews breakingNews}) =>
      LocalDatabase.insertNotification(breakingNews: breakingNews);

  Future<List<BreakingNews>> getAllNotification() =>
      LocalDatabase.getCachedNotification();

  // Future deleteNotification() => LocalDatabase.deleteAll();
}
