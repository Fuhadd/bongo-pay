import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/dialogs_and_popups/select_currency_dialog.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/transfer/transfer_currency_details_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransferCurrencyScreen extends StatefulHookConsumerWidget {
  static const routeName = '/TransferCurrencyScreen';
  const TransferCurrencyScreen({super.key});

  @override
  ConsumerState<TransferCurrencyScreen> createState() =>
      _TransferSameCurrencyScreenState();
}

class _TransferSameCurrencyScreenState
    extends ConsumerState<TransferCurrencyScreen> {
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
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  "Transfer Funds",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(40),
                verticalSpacer(10),
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
                            color: CustomColors.lighterBlackTextColor,
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
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                      errorText:
                                          'House number field cannot be empty '),
                                ],
                              ),
                              onChanged: (value) {
                                setState(() {
                                  receipientController.text =
                                      (int.parse(value!) * 1000).toString();
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showCurrencyDialog(
                                  context: context,
                                  provider: transferSelectedCurrencyProvider);
                            },
                            child: Row(
                              children: [
                                Text(
                                  ref.watch(transferSelectedCurrencyProvider),
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
                  "Limit: CAD 10,000.00",
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
                    Text(
                      "0.00 CAD = 0.00 CAD",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: CustomColors.greyTextColor,
                          fontWeight: FontWeight.w500),
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
                          "Recipient receives",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: CustomColors.lighterBlackTextColor,
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
                                      transferReceipientSelectedCurrencyProvider);
                            },
                            child: Row(
                              children: [
                                Text(
                                  ref.watch(
                                      transferReceipientSelectedCurrencyProvider),
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
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 30.0 + MediaQuery.of(context).padding.bottom),
              child: CustomButton(
                title: "Proceed",
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(TransferSameCurrencyDetailsScreen.routeName);
                },
              ),
            ),
          ],
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
