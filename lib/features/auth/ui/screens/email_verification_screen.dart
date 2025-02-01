import 'package:e_commerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                Text('Welcome Back', style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8),
                Text('Please enter your email address', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey
                ),),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your email address';
                    }
                    if(EmailValidator.validate(value!) == false){
                      return 'Enter valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: (){
                  // if(_formKey.currentState!.validate()){}
                  Navigator.pushNamedAndRemoveUntil(context, OTPVerification.name, (predicate)=>false);
                }, child: const Text('Next'),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
