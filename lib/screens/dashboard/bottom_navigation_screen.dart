import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/convert/convert_screen.dart';
import 'package:bongo_pay/screens/dashboard/dashboard_screen.dart';
import 'package:bongo_pay/screens/more/more_screen.dart';
import 'package:bongo_pay/screens/rate/rate_screen.dart';
import 'package:bongo_pay/screens/trade/trade_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const routeName = '/BottomNavigationScreen';

  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenLists = [
      HomeScreen(
        onTradeTap: () {
          setState(() {
            index = 2;
          });
        },
        onConvertTap: () {
          setState(() {
            index = 1;
          });
        },
      ),
      const ConvertScreen(),
      const TradeScreen(),
      const RateScreen(),
      const MoreScreen(),
      // const ConvertScreen(),
      // const ConvertScreen(),
      // const ConvertScreen(),
    ];
    return PopScope(
      // onPopInvoked: () async {
      //   return Future.value(false);
      // },
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: CustomColors.orangeColor,

          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              BottomAppBar(
                // shadowColor: Colors.black.withOpacity(0.33),
                elevation: 0,
                padding: const EdgeInsets.all(0.0),
                // height: 70,
                // notchMargin: 5.0,
                color: CustomColors.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ConstantString.home,
                              height: 23,
                              color: index == 0
                                  ? CustomColors.orangeColor
                                  : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: index == 0
                                      ? CustomColors.orangeColor
                                      : CustomColors.greyColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ConstantString.convertIcon,
                              height: 24,
                              color: index == 1
                                  ? CustomColors.orangeColor
                                  : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "Convert",
                              style: TextStyle(
                                  color: index == 1
                                      ? CustomColors.orangeColor
                                      : CustomColors.greyColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ConstantString.tradeIcon,
                              height: 24,
                              color: index == 2
                                  ? CustomColors.orangeColor
                                  : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "Trade",
                              style: TextStyle(
                                  color: index == 2
                                      ? CustomColors.orangeColor
                                      : CustomColors.greyColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ConstantString.rateIcon,
                              height: 24,
                              color: index == 3
                                  ? CustomColors.orangeColor
                                  : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "Rate",
                              style: TextStyle(
                                  color: index == 3
                                      ? CustomColors.orangeColor
                                      : CustomColors.greyColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 4;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ConstantString.moreIcon,
                              height: 24,
                              color: index == 4
                                  ? CustomColors.orangeColor
                                  : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "More",
                              style: TextStyle(
                                  color: index == 4
                                      ? CustomColors.orangeColor
                                      : CustomColors.greyColor,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: screenLists[index],
        ),
      ),
    );
  }
}
