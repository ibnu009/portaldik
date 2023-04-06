import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portaldik/app/data/source/data_source.dart';
import 'package:portaldik/app/utils/get_controller_ext.dart';
import 'package:portaldik/app/utils/int_ext.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formGlobalKey =
      GlobalKey<FormState>(debugLabel: 'login_form_key');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final DataSource _dataSource = DataSource.instance;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> handleLogin() async {
    if (formGlobalKey.currentState!.validate()) {
      showLoadingDialog();
      try {
        var data = await _dataSource.login(
            emailController.text, passwordController.text);
        if (data.statusCode.isStatusSuccess()) {
          _dataSource.writeSecureTokenData('token', data.token ?? "");
          Get.offAllNamed(Routes.MAIN);
        } else {
          handleError(data.message);
        }
      } catch (ex) {
        debugPrint(ex.toString());
        handleError(ex.toString());
      }
    }
  }

  void handleError(String message) {
    showFailedDialog(
        title: 'Gagal',
        message: message,
        onTap: () {
          Get.back();
          Get.back();
        });
  }
}
