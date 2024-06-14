// ignore_for_file: use_build_context_synchronously

import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/constants/custom_string.dart';
import 'package:bongo_pay/models/chat_model.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/screens/dashboard/bottom_navigation_screen.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:bongo_pay/widgets/custom_button.dart';
import 'package:bongo_pay/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeChatScreen extends StatefulHookConsumerWidget {
  static const routeName = '/TradeChatScreen';
  const TradeChatScreen({super.key});

  @override
  ConsumerState<TradeChatScreen> createState() => _TradeChatScreenState();
}

class _TradeChatScreenState extends ConsumerState<TradeChatScreen> {
  TextEditingController messageController = TextEditingController();
  int selectedIndex = 0;
  bool botSent = false;
  String message = "";
  List<String> items = ["CAD", "NGN"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        verticalSpacer(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trade P2P",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                                color: CustomColors.blackColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                "Report",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.orangeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(20),
                  Container(
                    decoration: const BoxDecoration(
                      color: CustomColors.lightOrange,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ConstantString.profilePic,
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpacer(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "John Amber",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: CustomColors.blackColor,
                                    ),
                                  ),
                                  verticalSpacer(5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.starRateIcon,
                                      ),
                                      horizontalSpacer(2),
                                      SvgPicture.asset(
                                        ConstantString.starRateIcon,
                                      ),
                                      horizontalSpacer(2),
                                      SvgPicture.asset(
                                        ConstantString.starRateIcon,
                                      ),
                                      horizontalSpacer(2),
                                      SvgPicture.asset(
                                        ConstantString.starRateIcon,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "100,000 USD",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                  color: CustomColors.blackColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ConstantString.arrowFoward,
                              ),
                              Text(
                                "92,000.25 EUR",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                  color: CustomColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          Text(
                            "Bongo holds your funds until the merchant transaction is completed. Your fund is safe!",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: CustomColors.limitTextColor,
                            ),
                          ),
                          verticalSpacer(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Transaction cancels: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.limitTextColor,
                                    ),
                                  ),
                                  Text(
                                    "30mins",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    backgroundColor: CustomColors.whiteColor,
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                          height: 1.sh * 0.42,
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                verticalSpacer(30),
                                                Text(
                                                  "Confirm payment",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.sp,
                                                    color:
                                                        CustomColors.blackColor,
                                                  ),
                                                ),
                                                verticalSpacer(10),
                                                Text(
                                                  "Confirm if transaction has been received from the merchant. Do not click confirm if you haven’t received payment",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .greyTextColor,
                                                  ),
                                                ),
                                                verticalSpacer(30),
                                                Expanded(
                                                  child: SvgPicture.asset(
                                                    ConstantString.refreshIcon,
                                                  ),
                                                ),
                                                verticalSpacer(30),
                                                Center(
                                                  child: CustomButton(
                                                    title:
                                                        "Confirm transaction",
                                                    onTap: () async {
                                                      _showBottomModal(context);
                                                      await Future.delayed(
                                                          const Duration(
                                                              seconds: 1));
                                                      Navigator.pop(context);
                                                      _showRateBottomModal(
                                                          context);
                                                    },
                                                  ),
                                                ),
                                                verticalSpacer(30),
                                              ],
                                            ),
                                          ));
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: CustomColors.orangeColor),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 7),
                                    child: Text(
                                      "Payment received",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: CustomColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  chats.isEmpty
                      ? Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Start conversation",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.greyTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              child: ListView.builder(
                                dragStartBehavior: DragStartBehavior.down,
                                itemCount: chats.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: chats[index].byMe
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10,
                                          right: !chats[index].byMe ? 50 : 0,
                                          left: chats[index].byMe ? 50 : 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: chats[index].byMe
                                              ? CustomColors.lighterOrange
                                              : CustomColors.textFieldColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(10),
                                            topRight: const Radius.circular(10),
                                            bottomLeft: !chats[index].byMe
                                                ? const Radius.circular(0)
                                                : const Radius.circular(10),
                                            bottomRight: chats[index].byMe
                                                ? const Radius.circular(0)
                                                : const Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0,
                                              left: 15,
                                              top: 10,
                                              bottom: 20),
                                          child: Text(
                                            chats[index].message,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: CustomColors
                                                  .lighterBlackTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: chatCustomTextField(
                      "email",
                      controller: messageController,
                      hintText: "Message",
                      prefix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ConstantString.emojiIcon,
                          ),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          message = value ?? "";
                        });
                      },
                    ),
                  ),
                  horizontalSpacer(15),
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      if (message.isNotEmpty) {
                        ChatModel newChat =
                            ChatModel(message: message, byMe: true);
                        chats.add(newChat);
                        setState(() {
                          message = "";
                          messageController.clear();
                        });
                        if (!botSent) {
                          await Future.delayed(const Duration(seconds: 1));
                          ChatModel botChat = ChatModel(
                              message:
                                  "Hi Just some moments I will be sending in the funds soon",
                              byMe: false);
                          chats.add(botChat);
                          setState(() {
                            botSent = true;
                          });
                        }
                      }
                    },
                    child: SvgPicture.asset(
                      ConstantString.sendIcon,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 5)
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
                  'Transfer Successful',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                verticalSpacer(10),
                const Text(
                  'Transaction was successful',
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

  void _showRateBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, child) {
          return Container(
            height: 300,
            color: CustomColors.whiteColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rate Merchant',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    verticalSpacer(10),
                    const Text(
                      'Your feedback will help improve us provide better experience',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.greyTextColor),
                    ),
                    verticalSpacer(20),
                    horizontalSpacer(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantString.profilePic,
                              ),
                            ),
                          ),
                        ),
                        verticalSpacer(10),
                        const Text(
                          "John Amber",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: CustomColors.blackColor,
                          ),
                        ),
                        verticalSpacer(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                ref.read(rateProvider.notifier).state = 1;

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.of(context).pushReplacementNamed(
                                    BottomNavigationScreen.routeName);
                              },
                              child: SvgPicture.asset(
                                ref.watch(rateProvider) > 0
                                    ? ConstantString.starRateIcon
                                    : ConstantString.starOutlined,
                                height: 30,
                              ),
                            ),
                            horizontalSpacer(2),
                            GestureDetector(
                              onTap: () async {
                                ref.read(rateProvider.notifier).state = 2;

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.of(context).pushReplacementNamed(
                                    BottomNavigationScreen.routeName);
                              },
                              child: SvgPicture.asset(
                                ref.watch(rateProvider) > 1
                                    ? ConstantString.starRateIcon
                                    : ConstantString.starOutlined,
                                height: 30,
                              ),
                            ),
                            horizontalSpacer(2),
                            GestureDetector(
                              onTap: () async {
                                ref.read(rateProvider.notifier).state = 3;

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.of(context).pushReplacementNamed(
                                    BottomNavigationScreen.routeName);
                              },
                              child: SvgPicture.asset(
                                ref.watch(rateProvider) > 2
                                    ? ConstantString.starRateIcon
                                    : ConstantString.starOutlined,
                                height: 30,
                              ),
                            ),
                            horizontalSpacer(2),
                            GestureDetector(
                              onTap: () async {
                                ref.read(rateProvider.notifier).state = 4;

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.of(context).pushReplacementNamed(
                                    BottomNavigationScreen.routeName);
                              },
                              child: SvgPicture.asset(
                                ref.watch(rateProvider) > 3
                                    ? ConstantString.starRateIcon
                                    : ConstantString.starOutlined,
                                height: 30,
                              ),
                            ),
                            horizontalSpacer(2),
                            GestureDetector(
                              onTap: () async {
                                ref.read(rateProvider.notifier).state = 5;

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.of(context).pushReplacementNamed(
                                    BottomNavigationScreen.routeName);
                              },
                              child: SvgPicture.asset(
                                ref.watch(rateProvider) > 4
                                    ? ConstantString.starRateIcon
                                    : ConstantString.starOutlined,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
