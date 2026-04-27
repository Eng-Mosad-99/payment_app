import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_app/core/utils/api_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}

//* PaymentIntentObject  create payment intent (currency, amount , customerId)
//* create ephemeral key (customerId , stripe version)  ===> EphemeralKeyModel
//* init payment sheet (paymentIntentClientSecret , merchantDisplayName , customerId , customerEphemeralKeySecret)
//* present payment sheet()
