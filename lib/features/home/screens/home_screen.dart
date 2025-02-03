import 'package:e_commerce_ostad/app/app_constants.dart';
import 'package:e_commerce_ostad/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.appLogoNavSvg),
        actions: [
          AppBarIconButton(onTap: (){}, icon: Icons.person,)
        ],
      ),

      body: const Center(
        child: Text('home'),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onTap
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 16,
        child: const Icon(Icons.person, size: 18, color: Colors.black45),
      ),
    );
  }
}
