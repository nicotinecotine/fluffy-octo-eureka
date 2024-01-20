import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_assignment_to_n_company/models/json_model.dart';

final Logger logger = Logger();

class ApiClient {
  final Dio dio = Dio();

  Future<TourModel> fetchData() async {
    try {
      final response = await dio
          .get("https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff");
      logger.d(response.data);
      final tourData = TourModel.fromJson(response.data);
      logger.d("Received tour data: $tourData");
      return tourData;
    } catch (error) {
      logger.e("Error fetching data: $error");
      throw Exception("Failed to fetch data");
    }
  }
}
