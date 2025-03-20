import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jenisumkm_controller.dart';

class JenisumkmView extends GetView<JenisumkmController> {
  const JenisumkmView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JenisumkmController()); // Pastikan controller sudah didaftarkan
    final controller = Get.find<JenisumkmController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenis Umkm'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.jenisUmkmList.isEmpty) {
          return const Center(child: Text('Tidak ada data kategori'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.jenisUmkmList.length,
          itemBuilder: (context, index) {
            final jenisumkm = controller.jenisUmkmList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.category, color: Colors.blue),
                title: Text(jenisumkm['jenis_umkm'] ?? "umkm tidak tersedia"),
 // Gunakan ?? untuk menangani null
                onTap: () {
                  Get.snackbar('jenisumkm Dipilih', jenisumkm.jenisUmkm ?? "umkm tidak tersedia");

                },
              ),
            );
          },
        );
      }),
    );
  }
}
