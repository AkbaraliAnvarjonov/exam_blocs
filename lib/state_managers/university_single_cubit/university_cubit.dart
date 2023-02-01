import 'package:fifth_exam/data/models/my_response.dart';
import 'package:fifth_exam/data/my_locale/my_locale.dart';
import 'package:fifth_exam/data/services/university_api_service/university_api_sevice.dart';
import 'package:fifth_exam/state_managers/university_single_cubit/university_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniverSingleStateCubit extends Cubit<UniversityCubitSingleState> {
  UniverSingleStateCubit() : super(UniversityCubitSingleState());

  getAllUniversity() async {
    emit(UniversityCubitSingleState(status: Status.loading));
    MyResponse myResponse =
        await myLocale<UniversityApiService>().getUniversityList();
    if (myResponse.error == "") {
      emit(
          state.copyWith(universities: myResponse.data, status: Status.succes));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.error));
    }
  }
}
