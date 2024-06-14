import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/authentication/sign_in/otp_verification_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class PhoneinputScreen extends StatefulWidget {
  static const routeName = '/PhoneinputScreen';
  const PhoneinputScreen({super.key});

  @override
  State<PhoneinputScreen> createState() => _PhoneinputScreenState();
}

class _PhoneinputScreenState extends State<PhoneinputScreen> {
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      resizeToAvoidBottomInset: true,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: (!_isChecked ||
              (mobileNumber.isEmpty ||
                  (formKey.currentState!.validate() == false)))
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });
              Navigator.pushNamed(context, OtpVerificationScreen.routeName);
            },
      title: "Create New Account",
      subTitle: "Create new account to get started your transaction with Bongo",
      showFooter: true,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Phone Number",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            verticalSpacer(10),
            customPhoneTextField(
              "phone",
              hintText: "Phone Number",
              controller: phoneController,
              onChanged: (phone) {
                setState(() {
                  mobileNumberDialCode = phone.countryCode;
                  mobileNumber = phone.number;
                  completeMobileNumber = phone.completeNumber;
                });
              },
            ),
            verticalSpacer(20),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: CustomColors.greyColor.withOpacity(0.3),
                    height: 15,
                    width: 15,
                    child: Checkbox(
                      checkColor: CustomColors.whiteColor,
                      activeColor: CustomColors.orangeColor,
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: _isChecked
                                ? CustomColors.orangeColor
                                : CustomColors.blackColor),
                      ),
                    ),
                  ),
                  horizontalSpacer(10),
                  Expanded(
                    child: SizedBox(
                      child: RichText(
                        text: const TextSpan(
                          text: 'I agree with ',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.greyTextColor),
                          children: [
                            TextSpan(
                              text: 'Terms ',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.orangeColor),
                            ),
                            TextSpan(
                              text: 'and ',
                            ),
                            TextSpan(
                              text: 'Conditions ',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.orangeColor),
                            ),
                            TextSpan(
                              text:
                                  'agreement and Consent to receiving communication from Bongo',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
