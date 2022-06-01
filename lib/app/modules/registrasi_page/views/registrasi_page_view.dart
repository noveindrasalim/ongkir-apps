import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:ongkoskirimapps/app/modules/login_page/views/login_page_view.dart';

import '../controllers/registrasi_page_controller.dart';

class RegistrasiPageView extends GetView<RegistrasiPageController> {
  RegistrasiPageController controller = RegistrasiPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RegistrasiPageView'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsetsDirectional.all(20),
          children: [
            Container(
              width: double.infinity,
              child: Text(
                "Registrasi Akun Kamu",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller.fullName,
              autocorrect: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Full Name"),
                suffixIcon: Icon(Icons.person_add),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller.emailC,
              autocorrect: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller.passC,
              autocorrect: true,
              textInputAction: TextInputAction.done,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                controller.cekRegister();
              },
              child: Text("Registrasi Sekarang"),
            ),
          ],
        ));
  }
}
