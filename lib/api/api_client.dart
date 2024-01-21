import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/data.dart';
import 'package:test_assignment_to_n_company/screens/second_screen/data.dart';

final Logger logger = Logger();

class ApiClient {
  final Dio dio = Dio();

  Future<TourModel> fetchTourData() async {
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

  Future<Hotel> fetchRoomData() async {
    try {
      final response = await dio
          .get("https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2");
      logger.d(response.data);
      final roomData = Hotel.fromJson(response.data);
      logger.d("Received room data: $roomData");
      return roomData;
    } catch (error) {
      logger.e("Error fetching data: $error");
      throw Exception("Failed to fetch data");
    }
  }
}
