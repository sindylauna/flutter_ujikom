import 'package:get/get.dart';

import '../controllers/jenisumkm_controller.dart';

class JenisumkmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisumkmController>(
      () => JenisumkmController(),
    );
  }
}
