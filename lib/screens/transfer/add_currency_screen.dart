import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AddCurrencyScreen extends StatefulWidget {
  static const routeName = '/AddCurrencyScreen';
  const AddCurrencyScreen({super.key});

  @override
  State<AddCurrencyScreen> createState() => _AddCurrencyScreenState();
}

class _AddCurrencyScreenState extends State<AddCurrencyScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country? _selectedCountry = Country(
      countryCode: 'NG',
      name: 'Nigeria',
      phoneCode: '+234',
      e164Sc: 234,
      geographic: true,
      level: 1,
      example: 'example',
      displayName: 'displayName',
      displayNameNoCountryCode: 'displayNameNoCountryCode',
      e164Key: 'e164Key');
  bool isLoading = false;
  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 2));

        setState(() {
          isLoading = false;
        });
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      title: "Select Country",
      subTitle: "What country are you sending funds to?",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Country",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          verticalSpacer(15),
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  print('Select country: $country');
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              );
            },
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: CustomColors.textFieldColor,
              ),
              child: Row(
                children: [
                  horizontalSpacer(20),
                  Text(
                    _selectedCountry?.flagEmoji ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),
                  horizontalSpacer(10),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 20,
                  ),
                  horizontalSpacer(10),
                  Expanded(
                      child: Text(
                    _selectedCountry?.name ?? "",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.hintTextColor),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
