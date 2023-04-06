import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


extension GetControllerConverter on GetxController {
  void showSuccessDialog(
      {required String title, required String message, VoidCallback? onTap}) {
    if (Get.context == null) return;
    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.success,
        title: title,
        text: message,
        confirmBtnText: "OK",
        loopAnimation: false,
        barrierDismissible: false,
        confirmBtnColor: Colors.blue,
        onConfirmBtnTap: onTap);
  }

  void showLoadingDialog({String? loadingText}) {
    if (Get.context == null) return;

    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: loadingText ?? 'Loading..',
        barrierDismissible: false);
  }

  void showInfoDialog({required String infoText, String? title}) {
    if (Get.context == null) return;

    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.info,
        title: title ?? 'Info',
        text: infoText,
        barrierDismissible: true);
  }

  void showFailedDialog(
      {required String title, required String message, VoidCallback? onTap}) {
    if (Get.context == null) return;

    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.error,
        title: title,
        text: message,
        loopAnimation: false,
        barrierDismissible: false,
        confirmBtnColor: Colors.blue,
        onConfirmBtnTap: onTap);
  }

  void showWarningDialog(
      {required String title, required String message, VoidCallback? onTap}) {

    if (Get.context == null) return;
    CoolAlert.show(
        context: Get.context!,
        confirmBtnColor: Colors.blue,
        type: CoolAlertType.warning,
        title: title,
        text: message,
        loopAnimation: false,
        barrierDismissible: false,
        onConfirmBtnTap: onTap);
  }

  void showOkDialog(BuildContext context, String title, String message) {
    if (Get.context == null) return;

    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showYesNoDialog(
      {required String title,
      required String message,
      required Function() onYesTap,
      required Function() onNoTap}) {
    if (Get.context == null) return;

    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: onNoTap,
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: onYesTap,
            child: const Text('Iya'),
          ),
        ],
      ),
    );
  }
}
