import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/trade/buy_trade_widget.dart';
import 'package:bongo_pay/screens/trade/sell_trade_widget.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TradeScreen extends StatefulWidget {
  static const routeName = '/TradeScreen';
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(10),
            Text(
              "Trade P2P",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: CustomColors.blackColor,
              ),
            ),
            verticalSpacer(25),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.textFieldColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: CustomColors.blackColor,
                        unselectedLabelColor:
                            CustomColors.blackTextColor.withOpacity(0.6),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.greyColor.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 3,
                            ),
                          ],
                          color: CustomColors.whiteColor,
                        ),
                        controller: _tabController,
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 2),
                            child: Text("Buy"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Tab(
                              text: 'Sell',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 20,
                ),
                SvgPicture.asset(
                  ConstantString.searchIcon,
                ),
                horizontalSpacer(20),
                SvgPicture.asset(
                  ConstantString.sortIcon,
                ),
              ],
            ),
            verticalSpacer(15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    BuyTradeWidget(),
                    SellTradeWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
