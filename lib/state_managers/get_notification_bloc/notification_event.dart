import 'package:fifth_exam/data/models/notification_model/notification_model.dart';

abstract class NotificationEvent {}

class AddNotification extends NotificationEvent {
  AddNotification({required this.breakingNews});
  final BreakingNews breakingNews;
}

class FetchNotification extends NotificationEvent {}
