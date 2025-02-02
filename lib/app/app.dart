import 'package:e_commerce_ostad/app/app_theme_data.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/email_verification_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      // themeMode: ThemeMode.dark,
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        EmailVerification.name: (context)=> const EmailVerification(),
        OTPVerification.name: (context)=> const OTPVerification(),
        CompleteProfile.name: (context)=> const CompleteProfile(),
      }
    );
  }
}
