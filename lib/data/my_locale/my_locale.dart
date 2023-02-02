import 'package:fifth_exam/data/repository/notification_repository/notification_repository.dart';
import 'package:fifth_exam/data/services/university_api_service/university_api_sevice.dart';
import 'package:get_it/get_it.dart';

final myLocale = GetIt.instance;

void setUp() {
  myLocale.registerLazySingleton(() => UniversityApiService());
  myLocale.registerLazySingleton(() => NotificationRepository());
}
