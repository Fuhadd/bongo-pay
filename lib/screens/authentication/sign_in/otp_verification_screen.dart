import 'dart:async';

import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/authentication/sign_in/personal_details_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const routeName = '/OtpVerificationScreen';
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final pinController = TextEditingController();
  var isPin = false;

  bool buttonActive = false;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  String seconds = "60";
  bool isCountdownActive = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    setState(() {
      isCountdownActive = true;
    });
  }

  void stopTimer() {
    setState(() {
      countdownTimer?.cancel();
      isCountdownActive = false;
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = const Duration(minutes: 3);
      isCountdownActive = false;
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        if (countdownTimer != null) {
          countdownTimer?.cancel();
        }
        isCountdownActive = false;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    seconds = strDigits(myDuration.inSeconds.remainder(60));
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: !(pinController.text.length >= 4)
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });
              Navigator.pushNamed(context, PersonalDetailsScreen.routeName);
            },
      title: "OTP verification",
      subTitle:
          "An OTP has been sent to your mobile number. Enter the OTP sent to your mobile number",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter Code",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          verticalSpacer(10),
          PinCodeTextField(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            appContext: context,
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            controller: pinController,
            pinTheme: PinTheme(
              fieldOuterPadding: const EdgeInsets.only(right: 4.0, left: 4.0),
              shape: PinCodeFieldShape.box,
              fieldHeight: 50,
              fieldWidth: ((MediaQuery.of(context).size.width - 50) - 50) / 4,
              selectedColor: CustomColors.otpInputColor,
              selectedFillColor: CustomColors.whiteColor,
              activeFillColor: CustomColors.orangeColor.withOpacity(0.1),
              activeColor: CustomColors.otpInputColor,
              inactiveColor: CustomColors.otpInputColor,
              inactiveFillColor: CustomColors.otpInputColor,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(10),
            ),
            cursorColor: CustomColors.orangeColor.withOpacity(0.6),
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            onCompleted: (v) {
              setState(() {
                isPin = true;
              });
            },
            onChanged: (value) {
              setState(() {
                isPin = pinController.text.length >= 4 ? true : false;
              });
            },
            beforeTextPaste: (text) {
              return true;
            },
          ),
          verticalSpacer(5),
          isCountdownActive
              ? Center(
                  child: Text(
                    "Expires in $minutes:$seconds seconds",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.blackColor.withOpacity(0.5)),
                  ),
                )
              : Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn’t receive an OTP?  ',
                      style: const TextStyle(
                          fontSize: 12, color: CustomColors.greyTextColor),
                      children: [
                        TextSpan(
                            text: 'Resend',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.orangeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  resetTimer();
                                  startTimer();
                                });
                              }),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
