import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ongkoskirimapps/app/modules/login_page/views/login_page_view.dart';
import 'package:flutter/material.dart';

class RegistrasiPageController extends GetxController {
  //TODO: Implement RegistrasiPageController
  TextEditingController fullName = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void cekRegister() {
    if (fullName.text == "" && emailC.text == "" && passC.text == "") {
      Get.defaultDialog(
        title: "Error",
        middleText: "Data Registrasi Tidak boleh Kosong",
        textCancel: "Cancel",
      );
    } else {
      Get.snackbar(
        "Akun Berhasil Di Registrasi",
        "Silahkan Login",
        snackPosition: SnackPosition.BOTTOM,
        mainButton: TextButton(
          onPressed: () {
            Get.offAll(LoginPageView());
          },
          child: Text("Login"),
        ),
      );
    }
  }
}
