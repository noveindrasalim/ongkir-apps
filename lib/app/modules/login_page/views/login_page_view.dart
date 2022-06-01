import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ongkoskirimapps/app/modules/home/views/home_view.dart';
import 'package:ongkoskirimapps/app/modules/main_page/views/main_page_view.dart';
import 'package:ongkoskirimapps/app/modules/registrasi_page/views/registrasi_page_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  LoginPageController controller = LoginPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPageView'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: double.infinity,
            height: 230,
            child: Lottie.asset("assets/lotties/login.json"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: true,
            controller: controller.userC,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              autocorrect: false,
              controller: controller.passC,
              obscureText: controller.isHidden.value,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () => controller.isHidden.toggle(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              controller.cekLogin();
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Belum Memiliki Akun?",
                ),
                TextButton(
                  onPressed: () {
                    Get.to(RegistrasiPageView());
                  },
                  child: Text("Klik disini"),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
