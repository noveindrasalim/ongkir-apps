import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/ongkir_model.dart';

class MainPageController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController beratC = TextEditingController();
  List<Ongkir> ongkosKirim = [];
  RxString kotaAsalId = "".obs;
  RxString provinsiAsalId = "".obs;
  RxString kotaTujuanId = "".obs;
  RxString provinsiTujuanId = "".obs;
  RxString cekKurir = "".obs;

  void cekOngkir() async {
    if (kotaAsalId != "0" &&
        provinsiAsalId != "0" &&
        kotaTujuanId != "0" &&
        provinsiTujuanId != "0" &&
        cekKurir != "0" &&
        beratC.text != "0") {
      try {
        isLoading.value = true;
        var response = await http.post(
            Uri.parse("https://api.rajaongkir.com/starter/cost"),
            headers: {
              "content-type": "application/x-www-form-urlencoded",
              "key": "1f48d6771415f79573c8e20c1a72421f",
            },
            body: {
              "origin": kotaAsalId.value,
              "destination": kotaTujuanId.value,
              "weight": beratC.text,
              "courier": cekKurir.value,
            });
        isLoading.value = false;
        List hasilResponse = json.decode(response.body)["rajaongkir"]["results"]
            [0]["costs"] as List;
        ongkosKirim = Ongkir.FromJsonList(hasilResponse);

        Get.defaultDialog(
          title: "Ongkos Kirim",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ongkosKirim
                .map((e) => ListTile(
                      title: Text("${e.service!.toUpperCase()}"),
                      subtitle: Text("Rp. ${e.cost![0].value}"),
                    ))
                .toList(),
          ),
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Data Tidak Ditemukan",
          textCancel: "Cancel",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Data Tidak boleh kosong",
        textCancel: "Cancel",
      );
    }
  }
}
