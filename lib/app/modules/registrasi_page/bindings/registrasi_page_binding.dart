import 'package:get/get.dart';

import '../controllers/registrasi_page_controller.dart';

class RegistrasiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrasiPageController>(
      () => RegistrasiPageController(),
    );
  }
}
