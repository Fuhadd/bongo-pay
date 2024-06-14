import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/onboarding/onboading_page_view.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, OnboardingPageViewScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ConstantString.splashScreenWithBg,
                fit: BoxFit.cover,
                height: 130.h,
              ),
              verticalSpacer(10),
              Text(
                "Bongo Pay",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
