import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/marketing_response.dart';

class MarketingController extends GetxController {
  var marketingList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMarketing();
  }

  void fetchMarketing() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.234.134:8000/api/marketing'), // Ganti jika endpoint berbeda
        headers: {
          'Authorization': 'Bearer mFGXi6PUMn90eJFzesXfbfVmd6WltINkIvSB16dNbce11703',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var result = marketing_response.fromJson(json.decode(response.body));
        marketingList.assignAll(result.data ?? []);
      } else {
        Get.snackbar("Error", "Gagal mengambil data marketing");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
