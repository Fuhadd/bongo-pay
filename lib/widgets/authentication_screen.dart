import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/get_help_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthFormWidget extends StatefulWidget {
  final Widget child;
  final Widget? footer;
  final String title, subTitle;
  final bool showFooter;
  final bool isAddressScreen;
  final bool removePadding;
  final bool isButtonLoading;
  final bool resizeToAvoidBottomInset;
  final bool isFormValid;
  final String buttonText;
  final void Function()? onButtonTap;
  final void Function()? onBackTap;
  final ScrollController? outerScrollController, innerScrollController;
  const AuthFormWidget(
      {super.key,
      required this.child,
      required this.subTitle,
      required this.title,
      this.removePadding = false,
      this.showFooter = false,
      this.isAddressScreen = false,
      this.buttonText = "Proceed",
      this.footer,
      this.onButtonTap,
      this.onBackTap,
      this.isButtonLoading = false,
      this.resizeToAvoidBottomInset = true,
      this.isFormValid = false,
      this.outerScrollController,
      this.innerScrollController});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final TextEditingController phoneController = TextEditingController();

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  // final bool _isChecked = false;
  bool _isConsentChecked = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.onBackTap == null ? false : true,
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            controller: widget.outerScrollController,
            child: SizedBox(
              height: 1.sh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(MediaQuery.of(context).padding.top + 40),
                        GestureDetector(
                          onTap: widget.onBackTap,
                          child: SvgPicture.asset(
                            ConstantString.back,
                          ),
                        ),
                        verticalSpacer(20),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        verticalSpacer(7),
                        Text(
                          widget.subTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CustomColors.greyTextColor,
                              height: 1.35),
                        ),
                        widget.removePadding
                            ? verticalSpacer(0)
                            : widget.isAddressScreen
                                ? verticalSpacer(30)
                                : verticalSpacer(50),
                        Expanded(
                          child: widget.isAddressScreen
                              ? NotificationListener<ScrollNotification>(
                                  onNotification: (scrollNotification) {
                                    if (scrollNotification
                                        is ScrollEndNotification) {
                                      if (widget.innerScrollController!.position
                                              .pixels ==
                                          widget.innerScrollController!.position
                                              .minScrollExtent) {
                                        // Inner ScrollView reached the top
                                        widget.outerScrollController!.animateTo(
                                          widget.outerScrollController!.position
                                              .minScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      } else if (scrollNotification
                                              .metrics.extentAfter ==
                                          0) {
                                        // Inner ScrollView reached the end
                                        widget.outerScrollController!.animateTo(
                                          widget.outerScrollController!.position
                                              .maxScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      }
                                    }
                                    return true;
                                  },
                                  child: widget.child,
                                )
                              : widget.child,
                        ),
                      ],
                    ),
                  ),
                  widget.removePadding ? verticalSpacer(0) : verticalSpacer(20),
                  CustomButton(
                    title: widget.buttonText,
                    onTap: widget.isButtonLoading
                        ? null
                        : (widget.showFooter == true && !_isConsentChecked)
                            ? null
                            : widget.onButtonTap,
                    isLoading: widget.isButtonLoading,
                  ),
                  verticalSpacer(20),
                  widget.showFooter
                      ? Column(
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     _isChecked = !_isChecked;
                              //   });
                              // },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color:
                                        CustomColors.greyColor.withOpacity(0.3),
                                    height: 15,
                                    width: 15,
                                    child: Checkbox(
                                      checkColor: CustomColors.whiteColor,
                                      activeColor: CustomColors.orangeColor,
                                      // shape: recta
                                      value: _isConsentChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isConsentChecked = value!;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 1.0,
                                            color: _isConsentChecked
                                                ? CustomColors.orangeColor
                                                : CustomColors.blackColor),
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(10),
                                  const SizedBox(
                                    child: Text(
                                      'I Consent to receiving communication from Bongo',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.greyTextColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(20),
                            const GetHelpRow(
                              centerAlign: true,
                            ),
                            verticalSpacer(30),
                          ],
                        )
                      : widget.footer ?? const SizedBox.shrink(),
                  (widget.isAddressScreen
                      ? verticalSpacer(20)
                      : verticalSpacer(40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
