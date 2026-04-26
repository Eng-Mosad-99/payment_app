import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: AppStyles.style18),

        Text(value, style: AppStyles.styleBold18),
      ],
    );
  }
}
