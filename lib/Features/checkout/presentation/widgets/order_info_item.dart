import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.style18,
        ),
        const Spacer(),
        Text(
          value,
          style: AppStyles.style18,
        ),
      ],
    );
  }
}