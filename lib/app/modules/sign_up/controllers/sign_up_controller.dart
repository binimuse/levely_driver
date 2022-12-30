import 'package:get/get.dart';

import '../../../constant/reusable_widget.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final reusableWidget = ReusableWidget();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
