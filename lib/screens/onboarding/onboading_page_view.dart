import 'package:bongo_pay/screens/authentication/sign_in/phone_input_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:bongo_pay/screens/onboarding/first_onboarding_page.dart';
import 'package:bongo_pay/screens/onboarding/fourth_onboarding_page.dart';
import 'package:bongo_pay/screens/onboarding/second_onboarding_page.dart';
import 'package:bongo_pay/screens/onboarding/third_onboarding_page.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/get_help_row.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/custom_colors.dart';
import '../../utils/spacers.dart';

class OnboardingPageViewScreen extends StatefulWidget {
  static const routeName = '/OnboardingPageViewScreen';
  const OnboardingPageViewScreen({super.key});

  @override
  State<OnboardingPageViewScreen> createState() =>
      _OnboardingPageViewScreenState();
}

class _OnboardingPageViewScreenState extends State<OnboardingPageViewScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> titleTexts = [
    'Transfer money internationally',
    'Currency exchange',
    'Exchange Rate Information',
    'Get started',
  ];
  final List<String> subTitleTexts = [
    'With Bongo you can transfer money internationally.',
    'With Bongo you can safely exchange your currencies.',
    'You get to see the exchange rate on Bongo.',
    'With Bongo you can send money to other people with safety.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(20),
              const GetHelpRow(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: const [
                    FirstOnboardingPage(),
                    SecondOnboardingPage(),
                    ThirdOnboardingPage(),
                    FourthOnboardingPage(),
                  ],
                ),
              ),
              verticalSpacer(30),
              SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                    activeDotColor: CustomColors.orangeColor,
                    dotColor: CustomColors.greyTextColor,
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 5,
                    expansionFactor: 4,
                    strokeWidth: 100),
              ),
              verticalSpacer(25),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            titleTexts[_currentPage],
                            key: ValueKey<String>(titleTexts[_currentPage]),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    SizedBox(
                      width: double.infinity,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            subTitleTexts[_currentPage],
                            key: ValueKey<String>(subTitleTexts[_currentPage]),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.4,
                                color: CustomColors.greyTextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  title: "Sign up",
                  onTap: () {
                    Navigator.pushNamed(context, PhoneinputScreen.routeName);
                  }),
              verticalSpacer(15),
              CustomButton(
                  title: "Login",
                  borderButton: true,
                  onTap: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  }),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
