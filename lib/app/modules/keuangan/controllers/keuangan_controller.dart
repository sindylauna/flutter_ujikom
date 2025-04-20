import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/keuangan_response.dart';


class KeuanganController extends GetxController {
  var keuanganList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchKeuangan();
  }

  void fetchKeuangan() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.65.134:8000/api/keuangan'), // Ganti sesuai endpoint API
        headers: {
          'Authorization': 'Bearer spffWNlXkRBg9xe8ys2WMFCZN3b5uQmGqxZUe13yb4ad9841',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var result = keuangan_response.fromJson(json.decode(response.body));
        keuanganList.assignAll(result.data ?? []);
      } else {
        Get.snackbar("Gagal", "Tidak bisa memuat data keuangan");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
