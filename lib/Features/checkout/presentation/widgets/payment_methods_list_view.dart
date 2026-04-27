import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Features/checkout/presentation/manager/payment_cubit.dart';
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
    // 'images/apple_pay.svg',
  ];
  // int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          var paymentCubit = context.read<PaymentCubit>();
          if (state is PaymentMethodChanged) {
            paymentCubit.index   = state.selectedIndex;
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: paymentMethodItem.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => paymentCubit.changeMethod(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: PaymentMethodItem(
                  isActive: paymentCubit.index == index,
                  image: paymentMethodItem[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
