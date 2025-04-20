import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/legalusaha_controller.dart';

class LegalusahaView extends GetView<LegalusahaController> {
  const LegalusahaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Legalitas Usaha'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.legalList.isEmpty) {
          return const Center(child: Text("Tidak ada data legalitas usaha."));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.legalList.length,
          itemBuilder: (context, index) {
            final item = controller.legalList[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Badan Usaha: ${item.badanUsaha ?? '-'}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text("Akta Pendirian: ${item.aktaPendirian ?? '-'}"),
                    Text("NIB: ${item.nIB ?? '-'}"),
                    Text("NPWP: ${item.nPWP ?? '-'}"),
                    Text("SIUP: ${item.sIUP ?? '-'}"),
                    Text("SKDP: ${item.sKDP ?? '-'}"),
                    Text("TDP: ${item.tDP ?? '-'}"),
                    const SizedBox(height: 8),
                    Text("Dibuat: ${item.createdAt ?? '-'}",
                        style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
