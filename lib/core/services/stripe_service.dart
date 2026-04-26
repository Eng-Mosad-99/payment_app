import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});

  //* 1 ====> PaymentIntentObject  create payment intent (currency, amount)
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputsModel inputs,
  }) async {
    try {
      final response = await apiService.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        data: inputs.toJson(),
        token: ApiKeys.secretKey,
      );
      return PaymentIntentModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //* 2 ====> init payment sheet (paymentIntentClientSecret)
  //* 3 ====> present payment sheet()
}
