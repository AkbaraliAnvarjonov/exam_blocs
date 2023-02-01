import 'package:fifth_exam/data/models/university_model.dart';

abstract class UniverMultiState {}

class MultiStateInitial extends UniverMultiState {}

class LoadDataInProgress extends UniverMultiState {}

class LoadDataInFailury extends UniverMultiState {
  String error;

  LoadDataInFailury({required this.error});
}

class LoadDataInSuccess extends UniverMultiState {
  List<UniversityModel> universities;

  LoadDataInSuccess({required this.universities});
}
