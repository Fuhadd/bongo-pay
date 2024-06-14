import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String email = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      resizeToAvoidBottomInset: false,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));

        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, BottomNavigationScreen.routeName);
      },
      buttonText: "Login",
      title: "Login",
      subTitle: "Welcome back. Enter your details to continue",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            verticalSpacer(10),
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
            verticalSpacer(20),
            const Text(
              "Password",
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
                    errorText: 'Good passwords are greater than 6 characters'),
                FormBuilderValidators.required(
                    errorText: 'Password field cannot be empty '),
              ]),
            ),
            verticalSpacer(20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
              },
              child: Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: CustomColors.orangeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
