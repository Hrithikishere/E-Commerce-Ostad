import 'package:e_commerce_ostad/app/app_theme_data.dart';
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
      }
    );
  }
}
