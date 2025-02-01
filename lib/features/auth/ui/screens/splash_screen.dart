import 'package:e_commerce_ostad/app/assets_path.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/email_verification_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2),);
    Navigator.pushNamedAndRemoveUntil(context, EmailVerification.name, (predicate)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogoWidget(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text('Version 1.0'),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
