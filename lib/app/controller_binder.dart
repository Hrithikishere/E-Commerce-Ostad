import 'package:e_commerce_ostad/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{

  @override
  void dependencies(){
    Get.put(MainBottomNavBarController());
  }
}