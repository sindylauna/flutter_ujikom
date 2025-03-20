import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_ujikom/app/utils/api.dart';


class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginNow() async { //fungsi _loginNow() dengan deklarasi kata kunci async
    final response = await _getConnect.post(BaseUrl.login, { //membuat variabel response yang dideklarasikan dengan kata kunci final, menggunakan fungsi _getConnect.post() untuk melakukan permintaan HTTP POST ke endpoint yang diberikan dalam konstanta BaseUrl.auth, dan mengirimkan email dan password yang dimasukkan pengguna dalam teks emailController dan passwordController. Respons HTTP disimpan dalam variabel response.
      'email': emailController.text, //mengirim email dari input emailController
      'password': passwordController.text, //mengirim password dari input passwordController
    });

    if (response.statusCode == 200) 
    { 
      authToken.write('token', response.body['access_token']);
      Get.offAll(() =>
     DashboardView()); 
    } else { 
      Get.snackbar(
        'Error', //parameter pesan yang ditampilkan dalam snackbar
        response.body['error'].toString(), //mengambil pesan kesalahan dari nilai kunci message dalam response.body
        icon: const Icon(Icons.error), //ikon yang ditampilkan pada snackbar
        backgroundColor: Colors.red, //warna latar belakang snackbar
        colorText: Colors.white, //warna teks pada snackbar
        forwardAnimationCurve: Curves.bounceIn, //kurva animasi pada snackbar
        margin: const EdgeInsets.only( //mengatur margin pada snackbar
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    }
  }
}