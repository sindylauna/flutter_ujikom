import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/keuangan_controller.dart';

class KeuanganView extends StatelessWidget {
  final controller = Get.put(KeuanganController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Keuangan"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.keuanganList.isEmpty) {
          return const Center(child: Text("Tidak ada data keuangan."));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.keuanganList.length,
          itemBuilder: (context, index) {
            final item = controller.keuanganList[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal: ${item.tanggal}", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Income: Rp${item.income?.toStringAsFixed(0)}"),
                    Text("Outcome: Rp${item.outcome?.toStringAsFixed(0)}"),
                    Text("Profit/Loss: Rp${item.profitLoss?.toStringAsFixed(0)}",
                      style: TextStyle(
                        color: (item.profitLoss ?? 0) < 0 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold
                      )),
                    const Divider(),
                    Text("Status: ${item.status}"),
                    Text("Verifikasi: ${item.statusVerifikasi}"),
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
