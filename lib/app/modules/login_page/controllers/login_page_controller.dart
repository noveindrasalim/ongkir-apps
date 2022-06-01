import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ongkoskirimapps/app/modules/main_page/views/main_page_view.dart';

class LoginPageController extends GetxController {
  RxBool isHidden = true.obs;

  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void cekLogin() {
    if (userC.text == "" && passC.text == "") {
      Get.defaultDialog(
          title: "Error",
          middleText: "User & Pass tidak boleh kosong",
          textCancel: "Cancel");
    } else {
      Get.offAll(() => MainPageView());
    }
  }
}
