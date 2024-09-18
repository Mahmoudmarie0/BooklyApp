import 'package:dio/dio.dart';

class ApiServices {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiServices({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await dio.get(endPoints);
    return response.data;
  }
}
