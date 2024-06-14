import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/more/profile_screen.dart';
import 'package:bongo_pay/screens/more/referral_screen.dart';
import 'package:bongo_pay/screens/more/security_screen.dart';
import 'package:bongo_pay/screens/more/wallet_screen.dart';
import 'package:bongo_pay/screens/onboarding/onboading_page_view.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/more_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "More",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    verticalSpacer(20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantString.profilePic,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -15,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.orangeColor),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                ConstantString.editIcon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    const Text(
                      "Amber Jay",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    verticalSpacer(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                        horizontalSpacer(2),
                        SvgPicture.asset(
                          ConstantString.starRateIcon,
                        ),
                      ],
                    ),
                    verticalSpacer(40),
                    const Row(
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.greyTextColor),
                        ),
                      ],
                    ),
                    verticalSpacer(30),
                    MoreWidgets(
                      icon: ConstantString.profileIcon,
                      title: "Profile",
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.walletIcon,
                      title: "Wallet",
                      onTap: () {
                        Navigator.pushNamed(context, WalletScreen.routeName);
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.securityIcon,
                      title: "Security",
                      onTap: () {
                        Navigator.pushNamed(context, SecurityScreen.routeName);
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.supportIcon,
                      title: "Support",
                      onTap: () {},
                    ),
                    MoreWidgets(
                      icon: ConstantString.supportIcon,
                      title: "Referral",
                      bottomPadding: 25,
                      onTap: () {
                        Navigator.pushNamed(context, ReferralScreen.routeName);
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.darkModeIcon,
                      title: "Dark mode",
                      bottomPadding: 25,
                      endLabel: SizedBox(
                        width: 50,
                        height: 40,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: CustomColors.profitGreenColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.logoutIcon,
                      title: "Logout",
                      color: CustomColors.lossRedColor,
                      endLabel: const SizedBox.shrink(),
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Container(
                                color: Colors.white,
                                height: 1.sh * 0.42,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.sp,
                                          color: CustomColors.blackColor,
                                        ),
                                      ),
                                      verticalSpacer(10),
                                      Text(
                                        "Are you sure you want to logout",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: CustomColors.greyTextColor,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Center(
                                        child: CustomButton(
                                          title: "Logout",
                                          buttonColor:
                                              CustomColors.lossRedColor,
                                          onTap: () async {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                OnboardingPageViewScreen
                                                    .routeName);
                                          },
                                        ),
                                      ),
                                      verticalSpacer(10),
                                      Center(
                                        child: CustomButton(
                                          title: "Cancel",
                                          textColor: CustomColors.lossRedColor,
                                          buttonColor: CustomColors.lossRedColor
                                              .withOpacity(0.2),
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ));
                          },
                        );
                      },
                    ),
                    verticalSpacer(6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
