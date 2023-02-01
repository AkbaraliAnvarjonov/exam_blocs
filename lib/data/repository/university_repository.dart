import 'package:fifth_exam/data/models/my_response.dart';
import 'package:fifth_exam/data/services/university_api_service/university_api_sevice.dart';

class CompanyRepos {
  CompanyRepos({required this.apiService});

  final UniversityApiService apiService;

  Future<MyResponse> getAllUniversity() => apiService.getUniversityList();
}
