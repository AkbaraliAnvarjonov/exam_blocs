import 'package:dio/dio.dart';
import 'package:fifth_exam/data/models/my_response.dart';
import 'package:fifth_exam/data/models/university_model.dart';
import 'package:fifth_exam/data/services/university_api_service/api_client.dart';

class UniversityApiService extends ApiClient {
  Future<MyResponse> getUniversityList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/search?name=middle");

      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => UniversityModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
