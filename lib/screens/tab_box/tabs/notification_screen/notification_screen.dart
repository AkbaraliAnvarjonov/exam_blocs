import 'package:fifth_exam/data/repository/notification_repository/notification_repository.dart';
import 'package:fifth_exam/screens/tab_box/tabs/notification_screen/widget/notification_widget.dart';
import 'package:fifth_exam/state_managers/get_notification_bloc/notification_bloc.dart';
import 'package:fifth_exam/state_managers/get_notification_bloc/notification_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationBloc(notificationRepository: NotificationRepository())
            ..fetchAllNotifications(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadGetNotificationProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadGetNotificationSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: NotificationItem(
                        imagePath: state.notifications[index].newsImage,
                        title: state.notifications[index].newsTitle,
                        description: state.notifications[index].description,
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text("Sizda notification hali yo'q"));
            }),
      ),
    );
  }
}
