import 'package:get/get.dart';
import 'package:portaldik/app/modules/main/tabs/home/controllers/home_controller.dart';
import 'package:portaldik/app/modules/main/tabs/profile/controllers/profile_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
