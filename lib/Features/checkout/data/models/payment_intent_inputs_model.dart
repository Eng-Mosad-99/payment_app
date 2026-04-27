class PaymentIntentInputsModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputsModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
