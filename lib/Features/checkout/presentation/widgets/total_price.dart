import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.style24.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          value,
          style: AppStyles.style24.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
