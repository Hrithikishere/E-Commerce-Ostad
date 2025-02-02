import 'package:e_commerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce_ostad/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:e_commerce_ostad/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNoController.dispose();
    _cityController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AppLogoWidget(width: 100,height: 100),
              const SizedBox(height: 16),
              Text('Complete Profile', style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 8),
              Text('Get started with us with your details', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey
              ),),
              const SizedBox(height: 24),
              _buildForm(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // if(_formKey.currentState!.validate()){}
                  // Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
                },
                child: const Text('Complete'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameController,
            decoration: const InputDecoration(
              hintText: 'First name',
            ),
            keyboardType: TextInputType.name,
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameController,
            decoration: const InputDecoration(
              hintText: 'Last name',
            ),
            keyboardType: TextInputType.name,
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLength: 11,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileNoController,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
            keyboardType: TextInputType.phone,
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your mobile no.';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
            keyboardType: TextInputType.text,
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your city';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressController,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
            ),
            keyboardType: TextInputType.text,
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your shipping address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
