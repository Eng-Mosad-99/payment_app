import 'package:flutter/material.dart';
import '../widgets/build_appbar.dart';
import '../widgets/payment_details_body.dart';


class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details',
      ),
      body: const PaymentDetailsBody(),
    );
  }
}