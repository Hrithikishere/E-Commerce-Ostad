import 'dart:async';
import 'package:e_commerce_ostad/app/app_colors.dart';
import 'package:e_commerce_ostad/app/app_constants.dart';
import 'package:e_commerce_ostad/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  static const String name = '/otp-verification';

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  RxBool _enableResendCodeButton = false.obs;

  void _startResendCodeTime(){
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t){
      _remainingTime.value--;
      if(_remainingTime.value < 1){
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  initState(){
    super.initState();
    _startResendCodeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'A 4 digit otp has been sent to your email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  controller: _otpController,
                  backgroundColor: Colors.white,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: AppColors.themeColor,
                    activeFillColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // if(_formKey.currentState!.validate()){}
                    Navigator.pushReplacementNamed(context, CompleteProfile.name);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                Obx(()=> Visibility(
                  visible: !_enableResendCodeButton.value,
                  child: RichText(
                      text: TextSpan(
                        text: 'This code will be expire in ',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '${_remainingTime.value}',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                ),
                Obx(()=>
                  Visibility(
                    visible: _enableResendCodeButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResendCodeTime();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
