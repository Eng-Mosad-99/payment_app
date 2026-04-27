import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';

import '../../../../core/widgets/custom_button.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 32),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
