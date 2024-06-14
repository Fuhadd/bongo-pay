import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FundNairaFromAccountScreen extends StatefulWidget {
  static const routeName = '/fundFromAccount';
  const FundNairaFromAccountScreen({super.key});

  @override
  State<FundNairaFromAccountScreen> createState() =>
      _FundNairaFromAccountScreenState();
}

class _FundNairaFromAccountScreenState
    extends State<FundNairaFromAccountScreen> {
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
                "Fund NGN",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              Text(
                "Daily deposit limit: ₦ 2,000,000 ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: CustomColors.greyTextColor,
                ),
              ),
              verticalSpacer(50),
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
                "email",
                initialValue: "Bongo",
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
              customTextField2("email",
                  initialValue: "2000123334",
                  readOnly: true,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ConstantString.copyIcon,
                      ),
                    ],
                  )),
              verticalSpacer(20),
              Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              customTextField2(
                "email",
                hintText: "Email",
                initialValue: "Amber Jay",
                readOnly: true,
                lighterText: true,
              ),
              verticalSpacer(60),
              CustomButton(
                title: "Copy Details",
                onTap: () {},
              ),
              verticalSpacer(15),
              Center(
                child: Text(
                  "See other limits",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: CustomColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
