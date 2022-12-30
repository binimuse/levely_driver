import 'package:get/get.dart';

import '../../map/controllers/map_controller.dart';
import '../controllers/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
    Get.lazyPut<MapController>(
      () => MapController(),
    );
  }
}
