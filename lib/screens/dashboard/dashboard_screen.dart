import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/contact_model.dart';
import 'package:bongo_pay/models/transaction_model.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/fund/fund_from_account_screen.dart';
import 'package:bongo_pay/screens/fund/fund_from_wallet_screen.dart';
import 'package:bongo_pay/screens/transfer/transfer_currency_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_icon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulWidget {
  final void Function()? onTradeTap, onConvertTap;

  const HomeScreen(
      {super.key, required this.onTradeTap, required this.onConvertTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantString.profilePic,
                              ),
                            ),
                          ),
                        ),
                        horizontalSpacer(10),
                        const Text(
                          "Hello, Amber 👋",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ],
                    ),
                    SvgPicture.asset(ConstantString.notificationIconWithCircle),
                  ],
                ),
              ),
              verticalSpacer(30),
              Column(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 210,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.15,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        WalletCardContainer(
                      showAmount: showAmount,
                      currency: itemIndex == 0 ? "\$" : "₦",
                      currencyIcon: itemIndex == 0
                          ? ConstantString.cadFlagImage
                          : ConstantString.ngnFlag,
                      currencyText: itemIndex == 0 ? "CAD" : "NGN",
                    ),
                  ),
                  verticalSpacer(10),
                  Container(
                    child: Center(
                      child: Container(
                        height: 10.0,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [0, 1].asMap().entries.map(
                            (e) {
                              return Container(
                                width: 8.w,
                                height: 8.h,
                                margin: EdgeInsets.only(right: 8.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedIndex == e.key
                                      ? CustomColors.activeIndicatorColor
                                      : CustomColors.inactiveIndicatorColor,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    verticalSpacer(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transfer to",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: CustomColors.greyTextColor,
                          ),
                        ),
                        Text("See all",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: CustomColors.orangeColor,
                            )),
                      ],
                    ),
                    verticalSpacer(20),
                    SizedBox(
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (index % 2 == 0)
                                                ? CustomColors
                                                    .contactBlackBgColor
                                                : CustomColors
                                                    .contactBlueBgColor),
                                        child: Center(
                                          child: Text(
                                            "GA",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp,
                                              color: CustomColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Image.asset(
                                          contacts[index].isNigeria
                                              ? ConstantString.ngnFlag
                                              : ConstantString.cadFlagImage,
                                          scale: 0.8,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                verticalSpacer(5),
                                Text(
                                  contacts[index].firstName,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CustomColors.lightBlackTextColor,
                                  ),
                                ),
                                Text(
                                  contacts[index].lastName,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CustomColors.lightBlackTextColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpacer(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomIconButton(
                            title: "Convert",
                            borderButton: true,
                            height: 50,
                            icon: ConstantString.convertIcon,
                            onTap: widget.onConvertTap,
                          ),
                        ),
                        horizontalSpacer(20),
                        Expanded(
                          child: CustomIconButton(
                            title: "Trade P2P",
                            borderButton: true,
                            height: 50,
                            icon: ConstantString.tradeIcon,
                            onTap: widget.onTradeTap,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction History",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: CustomColors.blackColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text("more",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: CustomColors.orangeColor,
                                )),
                            SvgPicture.asset(ConstantString.arrowRight),
                          ],
                        ),
                      ],
                    ),
                    verticalSpacer(25),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactionHistory.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ConstantString.robertImage),
                                        ),
                                      ),
                                    ),
                                    horizontalSpacer(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transactionHistory[index].fullName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        verticalSpacer(3),
                                        Text(
                                          transactionHistory[index].date,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color:
                                                  CustomColors.greyTextColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  transactionHistory[index].isProfit
                                      ? "+"
                                          "\$ ${transactionHistory[index].amount}"
                                      : "-"
                                          "\$ ${transactionHistory[index].amount}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: transactionHistory[index].isProfit
                                        ? CustomColors.profitGreenColor
                                        : CustomColors.lossRedColor,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpacer(10),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                color: CustomColors.otpInputColor,
                              ),
                            ),
                            verticalSpacer(10),
                          ],
                        );
                      },
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
