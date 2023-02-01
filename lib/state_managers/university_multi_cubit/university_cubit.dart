import 'package:fifth_exam/data/models/my_response.dart';
import 'package:fifth_exam/data/my_locale/my_locale.dart';
import 'package:fifth_exam/data/services/university_api_service/university_api_sevice.dart';
import 'package:fifth_exam/state_managers/university_multi_cubit/university_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniverMultiStateCubit extends Cubit<UniverMultiState> {
  UniverMultiStateCubit() : super(MultiStateInitial());

  getAllUniversity() async {
    emit(LoadDataInProgress());
    MyResponse myResponse =
        await myLocale<UniversityApiService>().getUniversityList();
    if (myResponse.error == "") {
      emit(LoadDataInSuccess(universities: myResponse.data));
    } else {
      emit(LoadDataInFailury(error: myResponse.error));
    }
  }
}
