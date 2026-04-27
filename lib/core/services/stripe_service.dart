import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

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
  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Mohamed Mosad',
      ),
    );
  }

  //* 3 ====> present payment sheet()
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //! For make payment we will create a function that will call the above three functions in order
  Future<void> makePayment({required PaymentIntentInputsModel inputs}) async {
   
      // 1. Create a payment intent on the server
      final paymentIntentModel = await createPaymentIntent(inputs: inputs);

      // 2. Initialize the payment sheet
      await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      );
      // 3. Display the payment sheet
      await displayPaymentSheet();
    
  }
}
