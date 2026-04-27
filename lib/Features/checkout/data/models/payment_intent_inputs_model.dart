class PaymentIntentInputsModel {
  final String amount;
  final String currency;

  PaymentIntentInputsModel({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    return {'amount': '${amount}00', 'currency': currency};
  }
}
