import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_auth/local_auth.dart';

class FundFromWalletScreen extends StatefulWidget {
  final String titleCurrency,
      dailyLimit,
      currencyText,
      currencyIcon,
      availableBalance;

  static const routeName = '/fundFromWallet';
  const FundFromWalletScreen(
      {super.key,
      required this.titleCurrency,
      required this.dailyLimit,
      required this.currencyText,
      required this.currencyIcon,
      required this.availableBalance});

  @override
  State<FundFromWalletScreen> createState() => _FundFromWalletScreenState();
}

class _FundFromWalletScreenState extends State<FundFromWalletScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  String amount = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.canPop(context)
                      ? Navigator.of(context).pop()
                      : null;
                },
                child: SvgPicture.asset(
                  ConstantString.back,
                ),
              ),
              verticalSpacer(20),
              Text(
                "Fund ${widget.titleCurrency}",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              Text(
                "Daily deposit limit: ${widget.dailyLimit}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: CustomColors.greyTextColor,
                ),
              ),
              verticalSpacer(30),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [],
                ),
                child: Card(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.orangeColor,
                      image: const DecorationImage(
                          image: AssetImage(
                            ConstantString.walletBg,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                widget.currencyIcon,
                                scale: 0.8,
                              ),
                              horizontalSpacer(5),
                              Text(
                                "${widget.currencyText} Wallet",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: CustomColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          Row(
                            children: [
                              Text(
                                widget.availableBalance,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: CustomColors.whiteColor,
                                ),
                              ),
                              horizontalSpacer(10),
                              Icon(
                                !showAmount
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 16,
                                color: CustomColors.whiteColor.withOpacity(0.9),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(30),
              Text(
                "Amount",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              customTextField(
                "email",
                hintText: "Enter Amount",
                // prefixIcon: FontAwesomeIcons.dollarSign,
                prefix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.currencyText == "CAD" ? "₦" : "\$",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15.sp,
                        color: CustomColors.blackColor,
                      ),
                    ),
                  ],
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'First name field cannot be empty '),
                    FormBuilderValidators.minLength(2,
                        errorText:
                            'A valid First name should be greater than 2 characters '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    amount = value!;
                  });
                },
              ),
              verticalSpacer(10),
              Center(
                child: Text(
                  "0.00 ${widget.currencyText}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: CustomColors.greyTextColor,
                  ),
                ),
              ),
              verticalSpacer(60),
              CustomButton(
                title: "Send",
                onTap: amount.isEmpty
                    ? null
                    : () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: CustomColors.whiteColor,
                          context: context,
                          builder: (context) {
                            // Using Wrap makes the bottom sheet height the height of the content.
                            // Otherwise, the height will be half the height of the screen.
                            return SizedBox(
                                height: 1.sh * 0.4,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      verticalSpacer(50),
                                      Text(
                                        "Confirm Deposit",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.sp,
                                          color: CustomColors.blackColor,
                                        ),
                                      ),
                                      verticalSpacer(10),
                                      Text(
                                        "Enter your pin to confirm your transaction",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: CustomColors.greyTextColor,
                                        ),
                                      ),
                                      verticalSpacer(30),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            try {
                                              final LocalAuthentication auth =
                                                  LocalAuthentication();
                                              // ···
                                              final bool
                                                  canAuthenticateWithBiometrics =
                                                  await auth.canCheckBiometrics;
                                              final bool canAuthenticate =
                                                  canAuthenticateWithBiometrics ||
                                                      await auth
                                                          .isDeviceSupported();

                                              if (canAuthenticateWithBiometrics &&
                                                  canAuthenticate) {
                                                print("Yes");
                                                final List<BiometricType>
                                                    availableBiometrics =
                                                    await auth
                                                        .getAvailableBiometrics();

                                                if (availableBiometrics
                                                    .isNotEmpty) {
                                                  // Some biometrics are enrolled.
                                                  print("Yes");
                                                  await auth.authenticate(
                                                      localizedReason:
                                                          'Scan your fingerprint or face to authenticate',
                                                      options:
                                                          const AuthenticationOptions(
                                                              useErrorDialogs:
                                                                  true,
                                                              stickyAuth: true,
                                                              biometricOnly:
                                                                  true));
                                                  _showBottomModal(context);
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 1));
                                                  Navigator.popUntil(
                                                      context,
                                                      ModalRoute.withName(
                                                          BottomNavigationScreen
                                                              .routeName));
                                                  print("object");
                                                } else {
                                                  _showBottomModal(context);
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 1));
                                                  Navigator.popUntil(
                                                      context,
                                                      ModalRoute.withName(
                                                          BottomNavigationScreen
                                                              .routeName));
                                                  print("object");
                                                }
                                              } else {
                                                print("No");
                                                _showBottomModal(context);
                                                await Future.delayed(
                                                    const Duration(seconds: 1));
                                                Navigator.popUntil(
                                                    context,
                                                    ModalRoute.withName(
                                                        BottomNavigationScreen
                                                            .routeName));
                                                print("object");
                                              }

                                              // }
                                            } catch (e) {
                                              debugPrint(e.toString());
                                              print("Cancel");

                                              // isLoading = false;
                                              // authorized = "Error - ${e.toString()}";
                                              // isBiometricsLoading = false;
                                              return;
                                            }
                                          },
                                          child: SvgPicture.asset(
                                            ConstantString.biometricWithCircle,
                                            // height: 70,
                                          ),
                                        ),
                                      ),
                                      verticalSpacer(30),
                                      Center(
                                        child: Text(
                                          "Use Pin",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: CustomColors.orangeColor,
                                          ),
                                        ),
                                      ),
                                      verticalSpacer(50),
                                    ],
                                  ),
                                ));
                          },
                        );
                      },
              ),
              verticalSpacer(20),
              Center(
                child: Text(
                  "See other limits",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: CustomColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CustomColors.whiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                verticalSpacer(10),
                const Text(
                  'Account successfully created',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.greyTextColor),
                ),
                verticalSpacer(20),
                SvgPicture.asset(
                  ConstantString.successIcon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
