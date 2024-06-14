import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/authentication/sign_in/biometrics_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/authentication_screen.dart';
import 'package:bongo_pay/widgets/id_type_dropdown.dart';
import 'package:bongo_pay/widgets/upload_id_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IdVerificationScreen extends StatefulHookConsumerWidget {
  static const routeName = '/IdVerificationScreen';
  const IdVerificationScreen({super.key});

  @override
  ConsumerState<IdVerificationScreen> createState() =>
      _IdVerificationScreenState();
}

class _IdVerificationScreenState extends ConsumerState<IdVerificationScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      isButtonLoading: isLoading,
      onButtonTap: (ref.watch(userPhotoFileProvider) == null &&
              ref.watch(userPhotoIdProvider) == null)
          ? null
          : () async {
              FocusScope.of(context).unfocus();
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });
              Navigator.pushNamed(context, BiometricsScreen.routeName);
            },
      buttonText: "Upload ID",
      title: "ID Verification",
      subTitle:
          "Let’s know more about you. Upload a clear ID for identification purpose.",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ID type",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          verticalSpacer(5),
          const IdTypeDropdown(),
          verticalSpacer(30),
          const Text(
            "Upload ID",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const Expanded(child: UploadIdDropdown()),
        ],
      ),
    );
  }
}
