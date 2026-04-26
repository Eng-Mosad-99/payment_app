import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30 , bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.sizeOf(context).height * 0.25 + 20,
            child: CustomDashedLined(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.25,
            left: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.25,
            right: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}