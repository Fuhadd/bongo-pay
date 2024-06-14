import 'package:bongo_pay/screens/authentication/sign_in/create_password_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class HomeAddressScreen extends StatefulWidget {
  static const routeName = '/HomeAddressScreen';
  const HomeAddressScreen({super.key});

  @override
  State<HomeAddressScreen> createState() => _HomeAddressScreenState();
}

class _HomeAddressScreenState extends State<HomeAddressScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController phoneController = TextEditingController();
  final innerScrollController = ScrollController();
  final outerScrollController = ScrollController();
  bool isLoading = false;
  String houseNumber = "";
  String streetName = "";
  String city = "";
  String state = "";

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      outerScrollController: outerScrollController,
      innerScrollController: innerScrollController,
      isButtonLoading: isLoading,
      onButtonTap: (houseNumber.isEmpty ||
              streetName.isEmpty ||
              city.isEmpty ||
              state.isEmpty)
          ? null
          : () async {
              FocusScope.of(context).unfocus();
              bool? validate = formKey.currentState?.validate();
              print(validate);
              if (validate == true) {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2));

                setState(() {
                  isLoading = false;
                });
                Navigator.pushNamed(context, CreatePasswordScreen.routeName);
              }
            },
      isAddressScreen: true,
      title: "Home address",
      subTitle: "Fill in the correct details correctly.",
      child: SingleChildScrollView(
        controller: innerScrollController,
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "House number",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "houseNumber",
                hintText: "Enter house number",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'House number field cannot be empty '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    houseNumber = value!;
                  });
                },
              ),
              verticalSpacer(20),
              const Text(
                "Street name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "streetName",
                hintText: "Enter your street name",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Street name field cannot be empty '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    streetName = value!;
                  });
                },
              ),
              verticalSpacer(20),
              const Text(
                "City",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "city",
                hintText: "Enter your city",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'City field cannot be empty '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    city = value!;
                  });
                },
              ),
              verticalSpacer(20),
              const Text(
                "State",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "state",
                hintText: "Enter your state",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'State field cannot be empty '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    state = value!;
                  });
                },
              ),
              verticalSpacer(20),
              const Text(
                "Postal / Zip code",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "postal",
                hintText: "Enter code",
              ),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
