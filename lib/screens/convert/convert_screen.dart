// ignore_for_file: unused_field

import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/dialogs_and_popups/select_currency_dialog.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConvertScreen extends StatefulHookConsumerWidget {
  static const routeName = '/ConvertScreen';
  const ConvertScreen({super.key, required});

  @override
  ConsumerState<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends ConsumerState<ConvertScreen> {
  TextEditingController receipientController = TextEditingController();
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";
  List<String> items = ["CAD", "NGN"];
  List<SalesData> _chartData = [];

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

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
                            Text(
                              "Converter",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                                color: CustomColors.blackColor,
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Fill in currency details to get current live rate",
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
                                      "From",
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
                                      ConstantString.convertIcon,
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
                                      "To",
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
                            verticalSpacer(30),
                            Text(
                              "Rate history",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: CustomColors.greyTextColor,
                              ),
                            ),
                            verticalSpacer(10),
                            SizedBox(
                                height: 150,
                                child: SfCartesianChart(
                                    primaryXAxis: const CategoryAxis(),
                                    series: <SplineSeries<SalesData, String>>[
                                      SplineSeries(
                                        dataSource: <SalesData>[
                                          SalesData('Sun', 10),
                                          SalesData('Mon', 30),
                                          SalesData('Tue', 26),
                                          SalesData('Wed', 20),
                                          SalesData('Thu', 40),
                                          SalesData('Fri', 32),
                                          SalesData('Sat', 30),
                                        ],
                                        color: CustomColors.profitGreenColor,
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                      ),
                                      SplineSeries(
                                        dataSource: <SalesData>[
                                          SalesData('Sun', 40),
                                          SalesData('Mon', 10),
                                          SalesData('Tue', 30),
                                          SalesData('Wed', 40),
                                          SalesData('Thu', 10),
                                          SalesData('Fri', 40),
                                          SalesData('Sat', 38),
                                        ],
                                        color: CustomColors.lossRedColor,
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                      ),
                                    ]))
                          ],
                        ),
                      ),
                    ],
                  ),
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

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData('Jan', 35),
      SalesData('Feb', 28),
      SalesData('Mar', 34),
      SalesData('Apr', 32),
      SalesData('May', 40)
    ];

    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
