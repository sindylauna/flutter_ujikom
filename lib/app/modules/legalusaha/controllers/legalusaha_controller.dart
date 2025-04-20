import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/legalusaha_response';

class LegalusahaController extends GetxController {
  var legalList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLegalData();
  }

  void fetchLegalData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.65.134:8000/api/legalusaha'), // Ganti dengan endpoint-mu
        headers: {
          'Authorization': 'Bearer spffWNlXkRBg9xe8ys2WMFCZN3b5uQmGqxZUe13yb4ad9841',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final result = legalusaha_response.fromJson(json.decode(response.body));
        legalList.assignAll(result.data ?? []);
      } else {
        Get.snackbar("Error", "Gagal mengambil data legal usaha");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
