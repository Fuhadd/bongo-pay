import 'package:bongo_pay/screens/authentication/sign_in/biometrics_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/country_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/create_password_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/home_address_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/id_veridfication_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/otp_verification_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/personal_details_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/phone_input_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_in/transaction_pin_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:bongo_pay/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/screens/fund/fund_from_account_screen.dart';
import 'package:bongo_pay/screens/more/profile_screen.dart';
import 'package:bongo_pay/screens/more/referral_screen.dart';
import 'package:bongo_pay/screens/more/security_screen.dart';
import 'package:bongo_pay/screens/more/support_screen.dart';
import 'package:bongo_pay/screens/more/wallet_screen.dart';
import 'package:bongo_pay/screens/onboarding/onboading_page_view.dart';
import 'package:bongo_pay/screens/trade/trade_chat_screen.dart';
import 'package:bongo_pay/screens/transfer/add_currency_screen.dart';
import 'package:bongo_pay/screens/transfer/beneficiary_screen.dart';
import 'package:bongo_pay/screens/transfer/receipt_screen.dart';
import 'package:bongo_pay/screens/transfer/transfer_currency_details_screen.dart';
import 'package:bongo_pay/screens/transfer/transfer_currency_screen.dart';

var appRoutes = {
  OnboardingPageViewScreen.routeName: (context) =>
      const OnboardingPageViewScreen(),
  BiometricsScreen.routeName: (context) => const BiometricsScreen(),
  CountryScreen.routeName: (context) => const CountryScreen(),
  CreatePasswordScreen.routeName: (context) => const CreatePasswordScreen(),
  HomeAddressScreen.routeName: (context) => const HomeAddressScreen(),
  IdVerificationScreen.routeName: (context) => const IdVerificationScreen(),
  OtpVerificationScreen.routeName: (context) => const OtpVerificationScreen(),
  PersonalDetailsScreen.routeName: (context) => const PersonalDetailsScreen(),
  PhoneinputScreen.routeName: (context) => const PhoneinputScreen(),
  TransactionPinScreen.routeName: (context) => const TransactionPinScreen(),
  BottomNavigationScreen.routeName: (context) => const BottomNavigationScreen(),
  FundFromAccountScreen.routeName: (context) => const FundFromAccountScreen(),
  AddCurrencyScreen.routeName: (context) => const AddCurrencyScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  TransferSameCurrencyDetailsScreen.routeName: (context) =>
      const TransferSameCurrencyDetailsScreen(),
  ReceiptScreen.routeName: (context) => const ReceiptScreen(),
  TransferCurrencyScreen.routeName: (context) => const TransferCurrencyScreen(),
  BeneficiaryScreen.routeName: (context) => const BeneficiaryScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ReferralScreen.routeName: (context) => const ReferralScreen(),
  SecurityScreen.routeName: (context) => const SecurityScreen(),
  SupportScreen.routeName: (context) => const SupportScreen(),
  WalletScreen.routeName: (context) => const WalletScreen(),
  TradeChatScreen.routeName: (context) => const TradeChatScreen(),
};
