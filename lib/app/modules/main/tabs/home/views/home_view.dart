import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../components/animation/show/direction.dart';
import '../../../../../components/animation/show/show_up_animation.dart';
import '../../../../../components/button/primary_button.dart';
import '../../../../../components/image/dotted_placeholder.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ambil foto',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          _studentPicture(),
          Obx(() => controller.imagePath.value != null
              ? _showButton()
              : const SizedBox())
        ],
      ),
    );
  }

  Widget _studentPicture() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: InkWell(
            onTap: controller.openCamera,
            child: SizedBox(
              height: 300,
              width: 250,
              child: controller.imagePath.value == null
                  ? const DottedPlaceHolder()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(controller.imagePath.value ?? ''),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
      child: ShowUpAnimation(
        delayStart: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        direction: Direction.vertical,
        offset: 0.5,
        child: PrimaryButton(
            isEnabled: true,
            width: double.infinity,
            onPressed: controller.handleUpload,
            text: 'Upload'),
      ),
    );
  }
}
