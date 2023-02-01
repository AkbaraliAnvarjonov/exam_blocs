import 'package:equatable/equatable.dart';
import 'package:fifth_exam/data/models/university_model/university_model.dart';

class UniversityCubitSingleState extends Equatable {
  Status? status;
  String? error;
  List<UniversityModel>? universities;

  UniversityCubitSingleState({
    this.status,
    this.error,
    this.universities,
  });

  UniversityCubitSingleState copyWith({
    Status? status,
    String? error,
    List<UniversityModel>? universities,
  }) {
    return UniversityCubitSingleState(
        error: error ?? this.error,
        universities: universities ?? this.universities,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, error, universities];
}

enum Status { pure, loading, error, succes }
