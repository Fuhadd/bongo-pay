import 'package:bongo_pay/screens/authentication/sign_in/home_address_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PersonalDetailsScreen extends StatefulWidget {
  static const routeName = '/PersonalDetailsScreen';
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      buttonText: "Register",
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: (firstName.isEmpty || lastName.isEmpty || email.isEmpty)
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
                Navigator.pushNamed(context, HomeAddressScreen.routeName);
              }
            },
      title: "Let’s know more about you",
      subTitle: "Create new account to get started your transaction with Bongo",
      child: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First Name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "firstName",
                hintText: "Enter your first name",
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
                    firstName = value!;
                  });
                },
              ),
              verticalSpacer(30),
              const Text(
                "Last Name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "lastName",
                hintText: "Enter your last name",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Last name field cannot be empty '),
                    FormBuilderValidators.minLength(2,
                        errorText:
                            'A valid Last name should be greater than 2 characters '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    lastName = value!;
                  });
                },
              ),
              verticalSpacer(30),
              const Text(
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "email",
                hintText: "Enter your email address",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.email(
                        errorText: 'Provided email not valid '),
                    FormBuilderValidators.required(
                        errorText: 'Email field cannot be empty '),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
