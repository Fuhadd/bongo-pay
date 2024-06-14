import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/rate_model.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RateScreen extends StatefulWidget {
  static const routeName = '/RateScreen';
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";
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
              verticalSpacer(20),
              Text(
                "Exchange Rate",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(25),
              searchCustomTextField("email",
                  hintText: "Search currency",
                  readOnly: true,
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ConstantString.searchIcon,
                      ),
                    ],
                  )),
              verticalSpacer(30),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: rates.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.canPop(context)
                            ? Navigator.of(context).pop()
                            : null;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                rates[index].flagImage,
                              ),
                              verticalSpacer(5),
                              Text(
                                "USD / CAD",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: CustomColors.lighterBlackTextColor),
                              ),
                              verticalSpacer(10),
                              Text(
                                "1.35 CAD",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: CustomColors.blackColor),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            ConstantString.arrowFoward,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    rates[index].isProfit
                                        ? ConstantString.positiveGraph
                                        : ConstantString.negativeGraph,
                                  ),
                                  horizontalSpacer(5),
                                  Text(
                                    "4.2%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      color: rates[index].isProfit
                                          ? CustomColors.profitGreenColor
                                          : CustomColors.lossRedColor,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpacer(5),
                              Text(
                                "1 USD",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: CustomColors.blackColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
