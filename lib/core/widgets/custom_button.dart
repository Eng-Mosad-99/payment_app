import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String? buttonText;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff34a853),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  buttonText ?? 'Complete Payment',
                  style: AppStyles.style22,
                ),
        ),
      ),
    );
  }
}
