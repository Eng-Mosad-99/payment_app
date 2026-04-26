import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_styles.dart';

class CreditCardInfoWidget extends StatelessWidget {
  const CreditCardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        children: [
          SvgPicture.asset('images/logo_master_card.svg'),
          SizedBox(width: 22),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Credit Card ', style: AppStyles.style18),
                TextSpan(
                  text: 'Mastercard **78',
                  style: AppStyles.style18.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
