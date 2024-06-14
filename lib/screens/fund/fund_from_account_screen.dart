import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FundFromAccountScreen extends StatefulWidget {
  static const routeName = '/fundFromAccount';
  const FundFromAccountScreen({super.key});

  @override
  State<FundFromAccountScreen> createState() => _FundFromAccountScreenState();
}

class _FundFromAccountScreenState extends State<FundFromAccountScreen> {
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
                "Fund CAD",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              Text(
                "Follow the instructions below to fund your Bongopay CAD wallet.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: CustomColors.greyTextColor,
                ),
              ),
              verticalSpacer(50),
              Center(child: SvgPicture.asset(ConstantString.moneyReciveIcon)),
              verticalSpacer(40),
              const FundInfoRow(
                icon: ConstantString.bankIcon,
                title:
                    "Login to your banking app and send money to info@bongopaynents.com",
              ),
              verticalSpacer(20),
              const FundInfoRow(
                icon: ConstantString.verifiedPersonIcon,
                title:
                    "Make sure you are sending money from your verified interac address (email you’ve registered)",
              ),
              verticalSpacer(20),
              const FundInfoRow(
                icon: ConstantString.timeIcon,
                title:
                    "It takes an average of 10-15 minutes for funds to appear in wallet ",
              ),
              verticalSpacer(40),
              Text(
                "Payment Email",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(10),
              customTextField(
                "email",
                hintText: "Email",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'First name field cannot be empty '),
                    FormBuilderValidators.minLength(2,
                        errorText:
                            'A valid First name should be greater than 2 characters '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    paymentEmail = value!;
                  });
                },
              ),
              verticalSpacer(40),
              CustomButton(
                title: "Copy Email",
                onTap: paymentEmail.isEmpty ? null : () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FundInfoRow extends StatelessWidget {
  final String title;
  final String icon;
  const FundInfoRow({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        horizontalSpacer(15),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: CustomColors.greyTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
