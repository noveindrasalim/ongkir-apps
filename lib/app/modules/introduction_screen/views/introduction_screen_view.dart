import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:ongkoskirimapps/app/modules/login_page/views/login_page_view.dart';

import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenView extends GetView<IntroductionScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 30),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            // title: "Cek Ongkos Kirim",
            titleWidget: Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Cek Ongkos Kirim",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            body:
                "Aplikasi ini dibuat untuk mengecek berbagai macam jenis ongkos kirim, baik yang dikirim melalui pulau jawa maupun diluar pulau jawa. Tujuan aplikasi ini dibuat adalah untuk memantau harga jasa pengiriman paket.",
            image: Center(
              child: Lottie.asset("assets/lotties/welcome.json"),
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Tentang kami",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            body:
                "Kami merupakan sebuah organisasi yang dibentuk karena berbagai masalah yang ditemukan disekitar, oleh karena itu kami hadir untuk mengatasi masalah itu semua, mari kita berbagi untuk neger",
            image: Lottie.asset("assets/lotties/sayhay.json"),
          ),
          PageViewModel(
            titleWidget: Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            body:
                "Kebijakan privasi adalah pernyataan atau dokumen hukum yang mengungkapkan beberapa atau semua cara suatu pihak mengumpulkan, menggunakan, mengungkapkan, dan mengelola data pelanggan atau klien. ",
            image: Lottie.asset("assets/lotties/privacy.json"),
          ),
          PageViewModel(
            titleWidget: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(LoginPageView());
                },
                child: Text("Cari Kurir Kamu"),
              ),
            ),
            body: "",
            image: Lottie.asset("assets/lotties/trackyourpacket.json"),
          ),
        ],
        next: Text(
          "Next",
          style: TextStyle(
            color: Colors.greenAccent[700],
          ),
        ),
        showSkipButton: true,
        showNextButton: true,
        done: Text(
          "Login",
          style: TextStyle(
            color: Colors.greenAccent[700],
          ),
        ),
        skip: Text(
          "Skip",
          style: TextStyle(
            color: Colors.greenAccent[700],
          ),
        ),
        dotsDecorator: DotsDecorator(
            color: Colors.greenAccent.shade700,
            activeColor: Colors.blueAccent[700]),
        onDone: () {
          Get.offAll(LoginPageView());
        },
        onSkip: () => Get.defaultDialog(
          title: "Yakin Mau Di Skip?",
          content: Text(
              "Di dalam sini terdapat berbagai macam cara serta untuk login ke aplikasi yang mana bertujuan untuk mempermudah anda dalam menggunakan aplikasi ini, mohon dibaca baik baik yaa"),
          cancel: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Batal"),
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent[700],
            ),
          ),
          confirm: ElevatedButton(
            onPressed: () {
              Get.offAll(LoginPageView());
            },
            child: Text("Lanjut"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ),
      ),
    ));
  }
}
