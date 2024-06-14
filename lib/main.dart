import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/splash_screen.dart';
import 'package:bongo_pay/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Mulish',
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.whiteColor)
              .copyWith(background: CustomColors.whiteColor),
        ),
        home: const SplashScreen(),
        routes: appRoutes,
      ),
    );
  }
}
