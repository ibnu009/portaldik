import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portaldik/app/components/navigation/bottom_navigation.dart';
import 'package:portaldik/app/modules/main/tabs/home/views/home_view.dart';
import 'package:portaldik/app/modules/main/tabs/profile/views/profile_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PortalDik'),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: Obx(() => IndexedStack(
        index: controller.pageIndex.value,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ))
    );
  }

  Widget? bottomNavigationBar() {
    return Obx(() => BottomNavigation(
      onTap: controller.changeIndex,
      currentIndex: controller.pageIndex.value,
    ));
  }
}
