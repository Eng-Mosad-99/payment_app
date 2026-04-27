class InitPaymentSheetInputsModel {
  final String customerId;
  final String ephemeralKeySecret;
  final String paymentIntentClientSecret;

  InitPaymentSheetInputsModel({
    required this.customerId,
    required this.ephemeralKeySecret,
    required this.paymentIntentClientSecret,
  });

  Map<String, dynamic> toJson() {
    return {
      'customer': customerId,
      'secret': ephemeralKeySecret,
      'client_secret': paymentIntentClientSecret,
    };
  }
}