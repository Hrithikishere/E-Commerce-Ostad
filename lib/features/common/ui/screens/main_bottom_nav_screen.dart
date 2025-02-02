import 'package:e_commerce_ostad/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_ostad/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}


class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print("bottomNavController: ");
    // return GetBuilder<MainBottomNavBarController>(
    //   builder: (bottomNavController){
    //     print("bottomNavController: $bottomNavController");
    //     print("selectedIndex: ${bottomNavController.selectedIndex}");
    //     return Scaffold(
    //       body: _screens[bottomNavController.selectedIndex],
    //       bottomNavigationBar: NavigationBar(
    //         selectedIndex: bottomNavController.selectedIndex,
    //         onDestinationSelected: bottomNavController.changeIndex,
    //         destinations:
    //       const [
    //         NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    //         NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
    //         NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    //         NavigationDestination(icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
    //       ],
    //       ),
    //     );
    //   }
    // );
   return GetBuilder<MainBottomNavBarController>(
       builder: (bottomNavController){
       return Scaffold(
         body: _screens[bottomNavController.selectedIndex],
         bottomNavigationBar: NavigationBar(
           selectedIndex: bottomNavController.selectedIndex,
           onDestinationSelected: bottomNavController.changeIndex,
           destinations:
           const [
             NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
             NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
             NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
             NavigationDestination(icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
           ],
         ),
       );
   });
  }
}
