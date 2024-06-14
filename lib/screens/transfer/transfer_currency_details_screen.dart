import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/contact_model.dart';
import 'package:bongo_pay/screens/transfer/beneficiary_screen.dart';
import 'package:bongo_pay/screens/transfer/receipt_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class TransferSameCurrencyDetailsScreen extends StatefulWidget {
  static const routeName = '/TransferSameCurrencyDetailsScreen';
  const TransferSameCurrencyDetailsScreen({super.key});

  @override
  State<TransferSameCurrencyDetailsScreen> createState() =>
      _TransferSameCurrencyDetailsScreenState();
}

class _TransferSameCurrencyDetailsScreenState
    extends State<TransferSameCurrencyDetailsScreen> {
  TextEditingController receipientController = TextEditingController();
  int selectedIndex = 0;
  bool showAmount = true;
  String paymentEmail = "";
  List<String> items = ["CAD", "NGN"];
  String selectedCurrency = "CAD";
  String selectedReceipientCurrency = "CAD";
  List<String> nigerianBanks = [
    "Access Bank",
    "Citibank Nigeria",
    "Ecobank Nigeria",
    "Fidelity Bank Nigeria",
    "First Bank of Nigeria",
    "First City Monument Bank (FCMB)",
    "Guaranty Trust Bank (GTBank)",
    "Heritage Bank Plc",
    "Keystone Bank Limited",
    "Polaris Bank",
    "Stanbic IBTC Bank Nigeria",
    "Standard Chartered Bank Nigeria",
    "Sterling Bank Nigeria",
    "SunTrust Bank Nigeria",
    "Union Bank of Nigeria",
    "United Bank for Africa (UBA)",
    "Unity Bank Plc",
    "Wema Bank",
    "Zenith Bank"
  ];
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 25,
          right: 25,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: 100.0 + MediaQuery.of(context).padding.bottom),
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
                      "Transfer Funds",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Beneficiary",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: CustomColors.greyTextColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(BeneficiaryScreen.routeName);
                              },
                              child: Text("See all",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: CustomColors.blueColor,
                                  )),
                            ),
                          ],
                        ),
                        verticalSpacer(20),
                        SizedBox(
                          height: 85,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: newContacts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    newContacts[index].color),
                                            child: Center(
                                              child: Text(
                                                newContacts[index]
                                                        .firstName[0] +
                                                    newContacts[index]
                                                        .lastName[0],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10.sp,
                                                  color:
                                                      CustomColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Image.asset(
                                              newContacts[index].isNigeria
                                                  ? ConstantString.ngnFlag
                                                  : ConstantString.cadFlagImage,
                                              scale: 0.8,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    verticalSpacer(5),
                                    Text(
                                      newContacts[index].firstName,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: CustomColors.lightBlackTextColor,
                                      ),
                                    ),
                                    Text(
                                      newContacts[index].lastName,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: CustomColors.lightBlackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        verticalSpacer(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$100,000",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: CustomColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(40),
                        Text(
                          "Bank Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: CustomColors.blackColor,
                          ),
                        ),
                        verticalSpacer(10),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp),
                                  hint: const Text(
                                    "Select Bank",
                                    style: TextStyle(
                                        color: CustomColors.greyTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  value: selectedBank,
                                  onChanged: (String? newValue) async {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedBank = newValue;
                                      });
                                    }
                                  },
                                  items: nigerianBanks
                                      .map<DropdownMenuItem<String>>(
                                          (String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            color: CustomColors.blackColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(20),
                        Text(
                          "Bank Account Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: CustomColors.blackColor,
                          ),
                        ),
                        verticalSpacer(10),
                        customTextField(
                          "account",
                          hintText: "Enter recipient’s number",
                        ),
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
                        customTextField(
                          "email",
                          hintText: "Enter recipient’s number",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 30.0 + MediaQuery.of(context).padding.bottom),
                    child: CustomButton(
                      title: "Proceed",
                      onTap: () async {
                        try {
                          final LocalAuthentication auth =
                              LocalAuthentication();

                          final bool canAuthenticateWithBiometrics =
                              await auth.canCheckBiometrics;
                          final bool canAuthenticate =
                              canAuthenticateWithBiometrics ||
                                  await auth.isDeviceSupported();

                          if (canAuthenticateWithBiometrics &&
                              canAuthenticate) {
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
                              Navigator.pushReplacementNamed(
                                  context, ReceiptScreen.routeName);
                              print("object");
                            } else {
                              _showBottomModal(context);
                              await Future.delayed(const Duration(seconds: 1));
                              Navigator.pushReplacementNamed(
                                  context, ReceiptScreen.routeName);
                              print("object");
                            }
                          } else {
                            print("No");
                            _showBottomModal(context);
                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.pushReplacementNamed(
                                context, ReceiptScreen.routeName);
                            print("object");
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                          print("Cancel");

                          return;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                  'Fund Transfer Successful',
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
