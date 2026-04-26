
import 'package:flutter/material.dart';

class CustomDashedLined extends StatelessWidget {
  const CustomDashedLined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        20,
        (index) => Expanded(
          child: Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              color: Color(0xffB8B8B8),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
