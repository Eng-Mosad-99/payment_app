import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import '../views/thank_you_view.dart';
import 'payment_methods_list_view.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
              child: CustomButton(
                buttonText: 'Payment',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('Payment successful');
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ThankYouView(),
                      ),
                    );
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
