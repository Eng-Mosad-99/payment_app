import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16 , left: 22, right: 22,),
        child: Column(
          children: <Widget>[
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: AppStyles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: AppStyles.style20,
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(title: 'Date', value: '01/24/2023'),
            const SizedBox(height: 20),

            const PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            const SizedBox(height: 20),

            const PaymentItemInfo(title: 'To', value: 'Sam Louis'),
          ],
        ),
      ),
    );
  }
}

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          Text(
            title,
            style: AppStyles.style18,
          ),
          const Spacer(),
          Text(
            value,
            style: AppStyles.styleBold18,
          ), 
      ],
    );
  }
}
