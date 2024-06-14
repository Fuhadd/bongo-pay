import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/dialogs_and_popups/select_currency_dialog.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/trade/trade_chat_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeDetailsScreen extends StatefulHookConsumerWidget {
  static const routeName = '/TradeDetailsScreen';
  final String buttonText;
  const TradeDetailsScreen({super.key, required this.buttonText});

  @override
  ConsumerState<TradeDetailsScreen> createState() => _TradeDetailsScreenState();
}

class _TradeDetailsScreenState extends ConsumerState<TradeDetailsScreen> {
  TextEditingController receipientController = TextEditingController();
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";
  List<String> items = ["CAD", "NGN"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: SizedBox(
          height: 1.sh -
              (30.0 + MediaQuery.of(context).padding.bottom) -
              (MediaQuery.of(context).padding.top),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            verticalSpacer(10),
                            Text(
                              "Trade P2P",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                                color: CustomColors.blackColor,
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Fill in appropriate details",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: CustomColors.greyTextColor,
                              ),
                            ),
                            verticalSpacer(25),
                          ],
                        ),
                      ),
                      verticalSpacer(10),
                      Container(
                        decoration: const BoxDecoration(
                          color: CustomColors.lightOrange,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      // color: CustomColors.activeIndicatorColor,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          ConstantString.profilePic,
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "John Amber",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: CustomColors.blackColor,
                                        ),
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
                                              color:
                                                  CustomColors.limitTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              verticalSpacer(5),
                              Row(
                                children: [
                                  Text(
                                    "Transaction completes in: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.limitTextColor,
                                    ),
                                  ),
                                  Text(
                                    "30mins",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: CustomColors.textFieldColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 10, top: 10),
                                    child: Text(
                                      "Send",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color:
                                            CustomColors.lighterBlackTextColor,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: sendCustomTextField(
                                          "email",
                                          keyboardType: TextInputType.number,
                                          hintText: "Enter Amount",
                                          validator:
                                              FormBuilderValidators.compose(
                                            [
                                              FormBuilderValidators.required(
                                                  errorText:
                                                      'House number field cannot be empty '),
                                            ],
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value!.isEmpty) {
                                                receipientController.text =
                                                    "0.00";
                                              } else {
                                                receipientController.text =
                                                    (int.parse(value) * 1000)
                                                        .toString();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showCurrencyDialog(
                                              context: context,
                                              provider:
                                                  tradeSelectedCurrencyProvider);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ref.watch(
                                                  tradeSelectedCurrencyProvider),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            horizontalSpacer(5),
                                            const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                            ),
                                          ],
                                        ),
                                      ),
                                      horizontalSpacer(10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Limit: USD 10,000.00 - 22,000,500.00",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: CustomColors.limitTextColor,
                              ),
                            ),
                            verticalSpacer(20),
                            verticalSpacer(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: CustomColors.orangeColor,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                      ConstantString.tradeIcon,
                                      color: CustomColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            verticalSpacer(10),
                            verticalSpacer(20),
                            Container(
                              decoration: const BoxDecoration(
                                color: CustomColors.textFieldColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 10, top: 10),
                                    child: Text(
                                      "Receive",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color:
                                            CustomColors.lighterBlackTextColor,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: sendCustomTextField(
                                          "email",
                                          controller: receipientController,
                                          hintText: "Amount",
                                          readOnly: true,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      horizontalSpacer(10),
                                      GestureDetector(
                                        onTap: () {
                                          _showCurrencyDialog(
                                              context: context,
                                              provider:
                                                  tradeReceipientSelectedCurrencyProvider);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ref.watch(
                                                  tradeReceipientSelectedCurrencyProvider),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            horizontalSpacer(5),
                                            const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                            ),
                                          ],
                                        ),
                                      ),
                                      horizontalSpacer(10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Quantity: 449,300.78 USD",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: CustomColors.limitTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 30.0 + MediaQuery.of(context).padding.bottom,
                  left: 20,
                  right: 20,
                ),
                child: CustomButton(
                  title: widget.buttonText,
                  onTap: () {
                    Navigator.of(context).pushNamed(TradeChatScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCurrencyDialog({
    required BuildContext context,
    required StateProvider<String> provider,
  }) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SelectCurrencyDialog(
          provider: provider,
        );
      },
    );
  }
}
