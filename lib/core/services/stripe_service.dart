import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Features/checkout/data/init_payment_sheet_inputs_model.dart';
import 'package:payment_app/Features/checkout/data/models/customer_model/customer_model.dart';
import 'package:payment_app/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_modely.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //* customer ====> CustomerModel   createCustomer
  Future<CustomerModel> createCustomer() async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      data: {'name': 'Mohamed Mosad', 'email': 'mohamed.mosad@example.com'},
      token: ApiKeys.secretKey,
    );

    return CustomerModel.fromJson(response.data);
  }

  //* customer ====> EphemeralKeyModel  create ephemeral key
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      data: {"customer": customerId},
      token: ApiKeys.secretKey,
      isEphemeralKey: true,
    );

    return EphemeralKeyModel.fromJson(response.data);
  }

  //* 1 ====> PaymentIntentObject  create payment intent (currency, amount)
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputsModel inputs,
  }) async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: inputs.toJson(),
      token: ApiKeys.secretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  //* 2 ====> init payment sheet (paymentIntentClientSecret)
  Future<void> initPaymentSheet({
    required InitPaymentSheetInputsModel initPaymentSheetInputsModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret:
            initPaymentSheetInputsModel.paymentIntentClientSecret,
        merchantDisplayName: 'Mohamed Mosad',

        // Customer params
        customerId: initPaymentSheetInputsModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputsModel.ephemeralKeySecret,
      ),
    );
  }

  //* 3 ====> present payment sheet()
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputsModel paymentIntentInputsModel,
  }) async {
    final paymentIntentModel = await createPaymentIntent(
      inputs: paymentIntentInputsModel,
    );
    final ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputsModel.customerId,
    );
    var initPaymentSheetInputs = InitPaymentSheetInputsModel(
      customerId: paymentIntentInputsModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );

    await initPaymentSheet(initPaymentSheetInputsModel: initPaymentSheetInputs);

    await displayPaymentSheet();
  }
}
