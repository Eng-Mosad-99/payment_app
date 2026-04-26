import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    String? contentType,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
