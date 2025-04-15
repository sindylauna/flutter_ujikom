import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/marketing_controller.dart';

class MarketingView extends GetView<MarketingController> {
  const MarketingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Marketing'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.marketingList.isEmpty) {
          return const Center(child: Text('Data tidak tersedia'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.marketingList.length,
          itemBuilder: (context, index) {
            final item = controller.marketingList[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bulan: ${item.bulan ?? '-'} ${item.tahun ?? ''}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Target Tahunan: ${item.targetTahunan ?? '-'}"),
                    const SizedBox(height: 4),
                    Text("Target Bulanan: ${item.targetBulanan ?? '-'}"),
                    const SizedBox(height: 4),
                    Text("Dibuat pada: ${item.createdAt ?? '-'}"),
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
