import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JenisumkmController extends GetxController {
  var isLoading = true.obs;
  var jenisUmkmList = [].obs;
  
  static String jenisumkms = 'http://192.168.65.134:8000/api/jenisumkm';

  @override
  void onInit() {
    fetchJenisUmkm();
    super.onInit();
  }

  Future<void> fetchJenisUmkm() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(jenisumkms));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        jenisUmkmList.value = data['data']; // Sesuaikan dengan format JSON API
      } else {
        Get.snackbar("Error", "Gagal mengambil data UMKM");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
}
