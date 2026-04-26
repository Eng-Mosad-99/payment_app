// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/widgets/payment_methods_list_view.dart';

import '../../../../core/widgets/custom_button.dart';
import '../views/payment_details.dart';
import 'payment_methods_bottom_sheet.dart';
import 'order_info_item.dart';
import 'total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset('images/basket.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: '\$0'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: '\$8'),
          const Divider(thickness: 2, height: 34, color: Color(0xffc6c6c6)),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PaymentDetails()),
              // );
              showModalBottomSheet(
                context: context,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) => const PaymentMethodsBottomSheet(),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}