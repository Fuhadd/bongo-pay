import 'package:bongo_pay/constants/custom_string.dart';
import 'package:flutter/material.dart';

class SecondOnboardingPage extends StatelessWidget {
  static const routeName = '/secondOnboardingScreen';
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            ConstantString.currencyExchange,
            height: 150,
          ),
        ),
      ],
    );
  }
}
