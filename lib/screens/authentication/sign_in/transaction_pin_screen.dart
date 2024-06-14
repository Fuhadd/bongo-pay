import 'dart:async';

import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TransactionPinScreen extends StatefulWidget {
  static const routeName = '/TransactionPinScreen';
  const TransactionPinScreen({super.key});

  @override
  State<TransactionPinScreen> createState() => _TransactionPinScreenState();
}

class _TransactionPinScreenState extends State<TransactionPinScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  var isPin = false;
  var isConfirmPin = false;

  bool buttonActive = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: (!(pinController.text.length >= 4) ||
              (pinController.text != confirmPinController.text))
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });
              Navigator.pushNamed(context, BottomNavigationScreen.routeName);
            },
      title: "Transaction PIN",
      subTitle: "Set your transaction pin for better security",
      buttonText: "Done",
      footer: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BottomNavigationScreen.routeName);
        },
        child: const Center(
          child: Text(
            "Skip",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: CustomColors.orangeColor),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create PIN",
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
              borderRadius: BorderRadius.circular(5),
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

          verticalSpacer(15),
          const Text(
            "Confirm PIN",
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
            controller: confirmPinController,
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
              borderRadius: BorderRadius.circular(5),
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
                isConfirmPin =
                    confirmPinController.text.length >= 4 ? true : false;
              });
            },
            beforeTextPaste: (text) {
              return true;
            },
          ),

          verticalSpacer(5),

          // ElevatedButton(
          //     child: const Text("data"),
          //     onPressed: () {
          //       // signUpVM.resendOTP(OTPActionType.OnboardingSync.index);
          //       setState(() {
          //         resetTimer();
          //         startTimer();
          //       });
          //     },
          //   ),

          // customPhoneTextField(
          //   "phone",
          //   hintText: "Phone Number",
          //   controller: phoneController,
          //   validator: FormBuilderValidators.compose(
          //     [
          //       FormBuilderValidators.minLength(9,
          //           errorText:
          //               'A valid Last name should be greater than 9 characters '),
          //     ],
          //   ),
          //   onChanged: (phone) {
          //     setState(() {
          //       mobileNumberDialCode = phone.countryCode;
          //       mobileNumber = phone.number;
          //       completeMobileNumber = phone.completeNumber;
          //     });
          //   },
          // ),
          // verticalSpacer(20),
          // GestureDetector(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         color: CustomColors.greyColor.withOpacity(0.3),
          //         height: 15,
          //         width: 15,
          //         child: Checkbox(
          //           checkColor: CustomColors.whiteColor,
          //           activeColor: CustomColors.orangeColor,
          //           value: _isChecked,
          //           onChanged: (value) {
          //             setState(() {
          //               _isChecked = value!;
          //             });
          //           },
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(4.0),
          //           ),
          //           side: MaterialStateBorderSide.resolveWith(
          //             (states) => BorderSide(
          //                 width: 1.0,
          //                 color: _isChecked
          //                     ? CustomColors.orangeColor
          //                     : CustomColors.blackColor),
          //           ),
          //         ),
          //       ),
          //       horizontalSpacer(10),
          //       Expanded(
          //         child: SizedBox(
          //           child: RichText(
          //             text: const TextSpan(
          //               text: 'I agree with ',
          //               style: TextStyle(
          //                   fontSize: 11,
          //                   fontWeight: FontWeight.w400,
          //                   color: CustomColors.greyTextColor),
          //               children: [
          //                 TextSpan(
          //                   text: 'Terms ',
          //                   style: TextStyle(
          //                       fontSize: 11,
          //                       fontWeight: FontWeight.w400,
          //                       color: CustomColors.orangeColor),
          //                 ),
          //                 TextSpan(
          //                   text: 'and ',
          //                 ),
          //                 TextSpan(
          //                   text: 'Conditions ',
          //                   style: TextStyle(
          //                       fontSize: 11,
          //                       fontWeight: FontWeight.w400,
          //                       color: CustomColors.orangeColor),
          //                 ),
          //                 TextSpan(
          //                   text:
          //                       'agreement and Consent to receiving communication from Bongo',
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
