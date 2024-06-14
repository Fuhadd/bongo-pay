import 'package:bongo_pay/screens/authentication/sign_in/id_veridfication_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreatePasswordScreen extends StatefulWidget {
  static const routeName = '/CreatePasswordScreen';
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  String password = "";
  String confirmPassword = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: (password.isEmpty || confirmPassword.isEmpty)
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
                Navigator.pushNamed(context, IdVerificationScreen.routeName);
              }
            },
      buttonText: "Create Password",
      title: "Create Password",
      subTitle:
          "Your security is priority. Create a password to secure your account.",
      child: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "password",
                hintText: "Enter your password",
                suffixIcon: obscurePassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                obscureText: obscurePassword,
                onSuffixTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    password = value!;
                    print(password);
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.minLength(6,
                      errorText:
                          'Good passwords are greater than 6 characters'),
                  FormBuilderValidators.required(
                      errorText: 'Password field cannot be empty '),
                ]),
              ),
              verticalSpacer(30),
              const Text(
                "Confirm Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(5),
              customTextField(
                "confirm_password",
                hintText: "Re-enter your password",
                suffixIcon: obscureConfirmPassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                obscureText: obscureConfirmPassword,
                onSuffixTap: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value!;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.equal(password,
                      errorText: 'Passwords do not match!  '),
                ]),
              ),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
