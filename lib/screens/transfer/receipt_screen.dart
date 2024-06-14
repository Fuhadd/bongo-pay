import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReceiptScreen extends StatefulWidget {
  static const routeName = '/receipt Screen';
  const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        Navigator.of(context)
            .pushReplacementNamed(BottomNavigationScreen.routeName);
      },
      child: Scaffold(
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(BottomNavigationScreen.routeName);
                  },
                  child: SvgPicture.asset(
                    ConstantString.back,
                  ),
                ),
                verticalSpacer(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ConstantString.starIcon,
                    ),
                    Text(
                      "Bongo Pay",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: CustomColors.orangeColor,
                      ),
                    ),
                  ],
                ),
                verticalSpacer(30),
                Text(
                  "Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(10),
                customTextField2("email",
                    initialValue: "USD",
                    boldTitle: true,
                    readOnly: true,
                    prefix: Image.asset(
                      ConstantString.usFlagImg,
                    ),
                    suffix: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "100.000",
                            style: TextStyle(
                                color: CustomColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )),
                verticalSpacer(20),
                Text(
                  "Recipient",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(10),
                customTextField2(
                  "receipient",
                  initialValue: "Samuel Jackson",
                  readOnly: true,
                ),
                verticalSpacer(20),
                Text(
                  "Bank Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(10),
                customTextField2(
                  "bankName",
                  initialValue: "Bongo Bank",
                  readOnly: true,
                ),
                verticalSpacer(20),
                Text(
                  "Account Number",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(10),
                customTextField2(
                  "accountNumber",
                  initialValue: "0707234513",
                  readOnly: true,
                ),
                verticalSpacer(20),
                Text(
                  "Session ID",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: CustomColors.blackColor,
                  ),
                ),
                verticalSpacer(10),
                customTextField2(
                  "sessionId",
                  initialValue: "070723452345130997234513",
                  readOnly: true,
                ),
                verticalSpacer(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
