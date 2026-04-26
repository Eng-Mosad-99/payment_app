import 'package:flutter/material.dart';
import 'payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodItem = const [
    'images/master_card.svg',
    'images/paypal.svg',
    'images/apple_pay.svg',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodItem.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() => activeIndex = index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              image: paymentMethodItem[index],
            ),
          ),
        ),
      ),
    );
  }
}
