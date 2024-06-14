import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/contact_model.dart';
import 'package:bongo_pay/screens/trade/trade_details_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuyTradeWidget extends StatelessWidget {
  const BuyTradeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: detailedContacts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const TradeDetailsScreen(buttonText: "Buy"),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: detailedContacts[index].color,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ConstantString.profilePic,
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpacer(10),
                            Text(
                              index == 0 ? "Bongo" : "John Amber",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: CustomColors.blackColor,
                              ),
                            ),
                            horizontalSpacer(10),
                            index == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: CustomColors.orangeColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 7),
                                      child: Text(
                                        "Recommended",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: CustomColors.orangeColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                        verticalSpacer(5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ConstantString.starRateIcon,

                              // height: 10,
                            ),
                            horizontalSpacer(2),
                            SvgPicture.asset(
                              ConstantString.starRateIcon,

                              // height: 10,
                            ),
                            horizontalSpacer(2),
                            SvgPicture.asset(
                              ConstantString.starRateIcon,

                              // height: 10,
                            ),
                            horizontalSpacer(2),
                            SvgPicture.asset(
                              ConstantString.starRateIcon,

                              // height: 10,
                            ),
                            horizontalSpacer(5),
                            Container(
                              height: 15,
                              width: 1,
                              color: CustomColors.dividerGrey,
                            ),
                            horizontalSpacer(5),
                            SvgPicture.asset(
                              ConstantString.timerIcon,

                              // height: 10,
                            ),
                            horizontalSpacer(5),
                            Text(
                              "30mins",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: CustomColors.limitTextColor,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(5),
                        Text(
                          "Trading(s) 1217  Completion 91.30%",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: CustomColors.limitTextColor,
                          ),
                        ),
                        verticalSpacer(10),
                        Text(
                          "1 EUR / 1.08 USD",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: CustomColors.blackColor,
                          ),
                        ),
                        verticalSpacer(10),
                        Text(
                          "Quantity: 449,300.78 USD",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: CustomColors.limitTextColor,
                          ),
                        ),
                        verticalSpacer(5),
                        Text(
                          "Limit: EUR 10,000.00 - 22,000,500.00",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: CustomColors.limitTextColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // height: 20,
                      // width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: CustomColors.blueColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 7),
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            // fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: CustomColors.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpacer(5),
                const Divider(
                  color: CustomColors.otpInputColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
