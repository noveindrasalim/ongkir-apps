import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';
import '../../../data/models/city_model.dart';
import '../../../data/models/province_model.dart';
import 'package:dio/dio.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageController controller = MainPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cek Tujuan serta kota asal'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Center(
              child: Lottie.asset("assets/lotties/alamatawal.json"),
            ),
            Container(
              width: 100,
              child: Text(
                "Cek Provinsi Serta Kota Asal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<Province>(
              showSearchBox: true,
              popupItemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Provinsi Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              onFind: (text) async {
                var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/province",
                  queryParameters: {
                    "key": "1f48d6771415f79573c8e20c1a72421f",
                  },
                );
                return Province.FromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) =>
                  controller.provinsiAsalId.value = value!.provinceId ?? "0",
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<City>(
              showSearchBox: true,
              popupItemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} - ${item.cityName}"),
              ),
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kota Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              onFind: (text) async {
                var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/city?province=${controller.provinsiAsalId}",
                  queryParameters: {
                    "key": "1f48d6771415f79573c8e20c1a72421f",
                  },
                );
                return City.FromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) =>
                  controller.kotaAsalId.value = value!.cityId ?? "0",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              child: Text(
                "Cek Provinsi Serta Kota Tujuan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<Province>(
              showSearchBox: true,
              popupItemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Provinsi Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              onFind: (text) async {
                var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/province",
                  queryParameters: {
                    "key": "1f48d6771415f79573c8e20c1a72421f",
                  },
                );
                return Province.FromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) =>
                  controller.provinsiTujuanId.value = value!.provinceId ?? "0",
            ),
            SizedBox(
              height: 30,
            ),
            DropdownSearch<City>(
              showSearchBox: true,
              popupItemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} - ${item.cityName}"),
              ),
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kota Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              onFind: (text) async {
                var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/city?province=${controller.provinsiTujuanId}",
                  queryParameters: {
                    "key": "1f48d6771415f79573c8e20c1a72421f",
                  },
                );
                return City.FromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) =>
                  controller.kotaTujuanId.value = value!.cityId ?? "0",
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              autocorrect: false,
              controller: controller.beratC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Berat (gram)",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              child: Text(
                "Jasa Kurir Yang digunakan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<Map<String, dynamic>>(
              items: [
                {"code": "jne", "name": "JNE"},
                {"code": "pos", "name": "POS Indonesia"},
                {"code": "tiki", "name": "Tiki"},
              ],
              showSearchBox: true,
              popupItemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item['name']}"),
              ),
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kurir yang digunakan",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
              dropdownBuilder: (context, selectedItem) =>
                  Text("${selectedItem?['name'] ?? ''}"),
              onChanged: (value) =>
                  controller.cekKurir.value = value?['code'] ?? "",
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => ElevatedButton(
                  onPressed: () {
                    if (controller.isLoading.isFalse) {
                      controller.cekOngkir();
                    }
                  },
                  child: Text(controller.isLoading.isFalse
                      ? "Cek Ongkos Kirim"
                      : "Loading"),
                )),
          ],
        ));
  }
}
