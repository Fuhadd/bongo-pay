import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/screens/authentication/sign_in/country_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsScreen extends StatefulWidget {
  static const routeName = '/BiometricsScreen';
  const BiometricsScreen({super.key});

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  final TextEditingController phoneController = TextEditingController();

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
        buttonText: "Allow",
        title: "Biometrics",
        removePadding: true,
        subTitle: "Complete your biometrics for more security.",
        child: Center(
          child: SvgPicture.asset(
            ConstantString.biometricWithCircle,
          ),
        ),
        onButtonTap: () async {
          try {
            final LocalAuthentication auth = LocalAuthentication();

            final bool canAuthenticateWithBiometrics =
                await auth.canCheckBiometrics;
            final bool canAuthenticate =
                canAuthenticateWithBiometrics || await auth.isDeviceSupported();

            if (canAuthenticateWithBiometrics && canAuthenticate) {
              print("Yes");
              final List<BiometricType> availableBiometrics =
                  await auth.getAvailableBiometrics();

              if (availableBiometrics.isNotEmpty) {
                print("Yes");
                await auth.authenticate(
                    localizedReason:
                        'Scan your fingerprint or face to authenticate',
                    options: const AuthenticationOptions(
                        useErrorDialogs: true,
                        stickyAuth: true,
                        biometricOnly: true));
                _showBottomModal(context);
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pushNamed(context, CountryScreen.routeName);
                print("object");
              } else {
                _showBottomModal(context);
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pushNamed(context, CountryScreen.routeName);
                print("object");
              }
            } else {
              print("No");
              _showBottomModal(context);
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pushNamed(context, CountryScreen.routeName);
              print("object");
            }
          } catch (e) {
            debugPrint(e.toString());
            print("Cancel");

            return;
          }
        });
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CustomColors.whiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                verticalSpacer(10),
                const Text(
                  'Account successfully created',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.greyTextColor),
                ),
                verticalSpacer(20),
                SvgPicture.asset(
                  ConstantString.successIcon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
