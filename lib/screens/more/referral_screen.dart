import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/fund/fund_from_account_screen.dart';
import 'package:bongo_pay/screens/fund/fund_from_wallet_screen.dart';
import 'package:bongo_pay/screens/more/profile_screen.dart';
import 'package:bongo_pay/screens/transfer/transfer_currency_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_icon_button.dart';
import 'package:bongo_pay/widgets/more_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReferralScreen extends StatefulWidget {
  static const routeName = '/ReferralScreen';
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
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
                          "Referral",
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
                    verticalSpacer(20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantString.profilePic,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -15,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.orangeColor),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                ConstantString.editIcon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    const Text(
                      "Amber Jay",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    verticalSpacer(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                      ],
                    ),
                    verticalSpacer(60),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.orangeColor.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tell your friends about Bongo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: CustomColors.blackColor,
                                  ),
                                ),
                                verticalSpacer(5),
                              ],
                            ),
                            verticalSpacer(10),
                            Text(
                              "Share your special link with friends to invite them to use Bongo ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: CustomColors.greyTextColor,
                              ),
                            ),
                            verticalSpacer(10),
                            Row(
                              children: [
                                Text(
                                  "Link: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: CustomColors.limitTextColor,
                                  ),
                                ),
                                horizontalSpacer(5),
                                Text(
                                  "Bongojay123PayAmcz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: CustomColors.orangeColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: CustomColors.orangeColor,
                                  ),
                                ),
                                horizontalSpacer(5),
                                SvgPicture.asset(
                                  ConstantString.copyIcon,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(30),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.orangeColor.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        child: MoreWidgets(
                          bottomPadding: 0,
                          icon: ConstantString.profileIcon,
                          title: "Profile",
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProfileScreen.routeName);
                          },
                        ),
                      ),
                    ),
                    verticalSpacer(60),
                    CustomButton(
                      title: "Share link",
                      onTap: () {},
                    ),
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

class WalletCardContainer extends StatelessWidget {
  const WalletCardContainer({
    super.key,
    required this.showAmount,
    required this.currencyText,
    required this.currencyIcon,
    required this.currency,
  });

  final bool showAmount;
  final String currencyText;
  final String currencyIcon;
  final String currency;

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
          child: SizedBox(
            height: 210,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CustomColors.orangeColor,
                    image: DecorationImage(
                        image: AssetImage(
                          ConstantString.walletBg,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
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
                              "${currency}0.00",
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: CustomColors.lightWhiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomIconButton(
                            title: "Deposit",
                            width: 115,
                            height: 45,
                            onTap: () {
                              currencyText == "CAD"
                                  ? showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      backgroundColor: CustomColors.whiteColor,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                            height: 1.sh * 0.4,
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Fund CAD",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20.sp,
                                                      color: CustomColors
                                                          .blackColor,
                                                    ),
                                                  ),
                                                  verticalSpacer(10),
                                                  Text(
                                                    "How would you like to fund your wallet?",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .greyTextColor,
                                                    ),
                                                  ),
                                                  verticalSpacer(30),
                                                  CustomButton(
                                                    title: "Bank Transfer",
                                                    height: 50,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushReplacementNamed(
                                                              FundFromAccountScreen
                                                                  .routeName);
                                                    },
                                                  ),
                                                  verticalSpacer(20),
                                                  CustomButton(
                                                    title: "NGN Wallet",
                                                    borderButton: true,
                                                    height: 50,
                                                    onTap: () {
                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                          builder: (context) => FundFromWalletScreen(
                                                              titleCurrency:
                                                                  currencyText,
                                                              dailyLimit:
                                                                  "\$ 2,000",
                                                              currencyText:
                                                                  "NGN",
                                                              currencyIcon:
                                                                  ConstantString
                                                                      .ngnFlag,
                                                              availableBalance:
                                                                  "₦62,452.00")));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    )
                                  : showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      backgroundColor: CustomColors.whiteColor,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                            height: 1.sh * 0.4,
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Fund Naira",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20.sp,
                                                      color: CustomColors
                                                          .blackColor,
                                                    ),
                                                  ),
                                                  verticalSpacer(10),
                                                  Text(
                                                    "How would you like to fund your wallet?",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .greyTextColor,
                                                    ),
                                                  ),
                                                  verticalSpacer(30),
                                                  CustomButton(
                                                    title: "Bank Transfer",
                                                    height: 50,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushReplacementNamed(
                                                              FundFromAccountScreen
                                                                  .routeName);
                                                    },
                                                  ),
                                                  verticalSpacer(20),
                                                  CustomButton(
                                                    title: "CAD Wallet",
                                                    borderButton: true,
                                                    height: 50,
                                                    onTap: () {
                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                          builder: (context) => FundFromWalletScreen(
                                                              titleCurrency:
                                                                  currencyText,
                                                              dailyLimit:
                                                                  "₦ 2,000,000",
                                                              currencyText:
                                                                  "CAD",
                                                              currencyIcon:
                                                                  ConstantString
                                                                      .cadFlagImage,
                                                              availableBalance:
                                                                  "\$23,970.00")));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    );
                            },
                            icon: ConstantString.depositIcon,
                          ),
                          CustomIconButton(
                            title: "Transfer",
                            borderButton: true,
                            width: 115,
                            height: 45,
                            icon: ConstantString.transferIcon,
                            onTap: () {
                              ref
                                  .read(
                                      transferReceipientSelectedCurrencyProvider
                                          .notifier)
                                  .state = currencyText;
                              Navigator.of(context)
                                  .pushNamed(TransferCurrencyScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
