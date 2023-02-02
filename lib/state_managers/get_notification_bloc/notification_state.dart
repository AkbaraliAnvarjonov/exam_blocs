import 'package:fifth_exam/data/models/notification_model/notification_model.dart';

abstract class NotificationState {}

class InitialNotificationState extends NotificationState {}

class LoadGetNotificationProgress extends NotificationState {}

class LoadGetNotificationSuccess extends NotificationState {
  LoadGetNotificationSuccess({required this.notifications});

  final List<BreakingNews> notifications;
}
