import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardController extends GetxController {
  var isLoading = true.obs;
  var totalJenisUmkm = 0.obs;

  static String jenisumkms = 'http://192.168.130.134:8000/api/jenisumkm';

  @override
  void onInit() {
    fetchTotalJenisUmkm();
    super.onInit();
  }

  Future<void> fetchTotalJenisUmkm() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(jenisumkms));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        totalJenisUmkm.value = data['data'].length; // Ambil jumlah jenis UMKM
      } else {
        Get.snackbar("Error", "Gagal mengambil data UMKM");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
  void logout() {
    Get.offAllNamed("/login"); // Kembali ke halaman login dan hapus riwayat navigasi
  }
}
