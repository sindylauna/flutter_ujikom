import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/operasional_controller.dart';

class OperasionalView extends StatelessWidget {
  final controller = Get.put(OperasionalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Operasional UMKM'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.operasionalList.isEmpty) {
          return const Center(child: Text("Data tidak ditemukan"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.operasionalList.length,
          itemBuilder: (context, index) {
            final item = controller.operasionalList[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text(item.id.toString()),
                ),
                title: Text("Jumlah Karyawan: ${item.jmlKaryawan}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID UMKM: ${item.idUmkm}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
