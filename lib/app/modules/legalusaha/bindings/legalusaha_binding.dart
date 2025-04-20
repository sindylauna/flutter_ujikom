import 'package:get/get.dart';

import '../controllers/legalusaha_controller.dart';

class LegalusahaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LegalusahaController>(
      () => LegalusahaController(),
    );
  }
}
