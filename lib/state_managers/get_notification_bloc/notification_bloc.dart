import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/data/repository/notification_repository/notification_repository.dart';
import 'package:fifth_exam/state_managers/get_notification_bloc/notification_event.dart';
import 'package:fifth_exam/state_managers/get_notification_bloc/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({required this.notificationRepository})
      : super(InitialNotificationState()) {
    on<AddNotification>(addNotification);
  }

  final NotificationRepository notificationRepository;

  addNotification(AddNotification event, Emitter<NotificationState> emit) {
    emit(LoadGetNotificationProgress());
    notificationRepository.addNotification(breakingNews: event.breakingNews);
    fetchAllNotifications();
  }

  fetchAllNotifications() async {
    emit(LoadGetNotificationProgress());
    List<BreakingNews> notifications =
        await notificationRepository.getAllNotification();
    emit(LoadGetNotificationSuccess(notifications: notifications));
  }
}
