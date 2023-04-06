import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portaldik/app/utils/get_controller_ext.dart';
import 'package:portaldik/app/utils/int_ext.dart';

import '../../../../../data/source/data_source.dart';

class HomeController extends GetxController {
  final picker = ImagePicker();
  RxnString imagePath = RxnString(null);
  final DataSource _dataSource = DataSource.instance;

  Future openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    } else {}
  }

  Future<void> handleUpload() async {
    if (imagePath.value == null) {
      showWarningDialog(title: 'Warning', message: 'Belum memilih gambar');
      return;
    }
    showLoadingDialog();
    try {
      var data =
          await _dataSource.uploadImage(File(imagePath.value ?? ''), "1");
      if (data.statusCode.isStatusSuccess()) {
        showSuccessDialog(
            title: 'Berhasil', message: 'Gambar berhasil diunggah');
      } else {
        handleError("ERROR");
      }
    } catch (ex) {
      debugPrint(ex.toString());
      handleError(ex.toString());
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
