import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/more_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecurityScreen extends StatefulWidget {
  static const routeName = '/SecurityScreen';
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  int selectedIndex = 0;
  bool showAmount = true;
  bool isSwitched = true;
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
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
                  ],
                ),
              ),
              verticalSpacer(25),
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      "Security",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ],
                ),
              ),
              verticalSpacer(40),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    MoreWidgets(
                      icon: ConstantString.passwordKeyIcon,
                      title: "Change password",
                      bottomPadding: 25,
                      onTap: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordScreen.routeName);
                      },
                    ),
                    MoreWidgets(
                      icon: ConstantString.securityBiometricsIcon,
                      title: "Biometrics",
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
                            activeTrackColor: CustomColors.profitGreenColor,
                            activeColor: CustomColors.whiteColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
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
