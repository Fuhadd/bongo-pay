import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/contact_model.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BeneficiaryScreen extends StatefulWidget {
  static const routeName = '/beneficiary';
  const BeneficiaryScreen({super.key});

  @override
  State<BeneficiaryScreen> createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
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
                "Beneficiaries",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: CustomColors.blackColor,
                ),
              ),
              verticalSpacer(25),
              searchCustomTextField("email",
                  hintText: "Search beneficiaries",
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
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: detailedContacts.length,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: detailedContacts[index].color),
                                      child: Center(
                                        child: Text(
                                          detailedContacts[index].firstName[0] +
                                              detailedContacts[index]
                                                  .lastName[0],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.sp,
                                            color: CustomColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        detailedContacts[index].isNigeria
                                            ? ConstantString.ngnFlag
                                            : ConstantString.cadFlagImage,
                                        scale: 0.8,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              horizontalSpacer(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${detailedContacts[index].firstName} ${detailedContacts[index].lastName}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: CustomColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    "${detailedContacts[index].accountNumber} (${detailedContacts[index].bankName})",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: CustomColors.greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            ConstantString.deleteIcon,
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
