import 'package:dio/dio.dart';
import 'package:payment_app/core/utils/api_keys.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool isEphemeralKey = false,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $token',
            if (isEphemeralKey) 'Stripe-Version': ApiKeys.stripeVersion,
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
