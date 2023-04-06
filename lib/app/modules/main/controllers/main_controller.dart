import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt pageIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(int index) {
    pageIndex.value = index;
  }

}
