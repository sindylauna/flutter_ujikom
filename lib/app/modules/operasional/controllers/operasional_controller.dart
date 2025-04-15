import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/operasional_response.dart';


class OperasionalController extends GetxController {
  var operasionalList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOperasional();
  }

  void fetchOperasional() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.234.134:8000/api/operasional'), // Ganti sesuai endpoint
        headers: {
         'Authorization': 'Bearer mFGXi6PUMn90eJFzesXfbfVmd6WltINkIvSB16dNbce11703',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var result = operasional_response.fromJson(json.decode(response.body));
        operasionalList.assignAll(result.data ?? []);
      } else {
        Get.snackbar("Error", "Gagal mengambil data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
