import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/WalletScreen';
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
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
                  ],
                ),
              ),
              verticalSpacer(25),
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Wallet",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    verticalSpacer(25),
                    ShortWalletCardContainer(
                        showAmount: showAmount,
                        currency: "\$",
                        amount: "6,429.00",
                        currencyIcon: ConstantString.cadFlagImage,
                        currencyText: "CAD"),
                    verticalSpacer(25),
                    ShortWalletCardContainer(
                        showAmount: showAmount,
                        currency: "₦",
                        amount: "0.00",
                        currencyIcon: ConstantString.cadFlagImage,
                        currencyText: "NGN"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShortWalletCardContainer extends StatelessWidget {
  const ShortWalletCardContainer({
    super.key,
    required this.showAmount,
    required this.currencyText,
    required this.currencyIcon,
    required this.currency,
    required this.amount,
  });

  final bool showAmount;
  final String currencyText;
  final String currencyIcon;
  final String currency;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Container(
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
              borderRadius: BorderRadius.circular(10),
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
                        currencyIcon,
                        scale: 0.8,
                      ),
                      horizontalSpacer(5),
                      Text(
                        "$currencyText Wallet",
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
                        "$currency $amount",
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
      );
    });
  }
}
