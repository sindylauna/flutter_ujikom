import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/profile_response.dart';
import 'dart:convert';
 // pastikan path-nya sesuai

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var profile = Rx<profile_response?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  void fetchProfileData() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.65.134:8000/api/profile'), // Ganti dengan URL API kamu
        headers: {
          'Authorization': 'Bearer spffWNlXkRBg9xe8ys2WMFCZN3b5uQmGqxZUe13yb4ad9841', // Kalau pakai token
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        profile.value = profile_response.fromJson(jsonData);
      } else {
        print("Failed to load profile: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
