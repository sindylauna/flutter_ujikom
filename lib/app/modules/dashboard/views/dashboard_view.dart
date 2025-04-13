import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key}) {
    Get.put(DashboardController()); // Inisialisasi Controller
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard UMKM"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text("Operaasional"),
              onTap: () {
                Get.toNamed("/operasional");
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("Keuangan"),
              onTap: () {
                Get.toNamed("/keuangan");
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Jenis UMKM"),
              onTap: () {
                Get.toNamed("/jenisumkm");
              },
            ),
            const Divider(), // Garis pemisah
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah Anda yakin ingin logout?",
                  textConfirm: "Ya",
                  textCancel: "Batal",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    controller.logout();
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildDashboardCard("Total UMKM", "120", Icons.business, Colors.blue),
              _buildDashboardCard("Meeting Pending", "5", Icons.event, Colors.orange),
              _buildDashboardCard(
                "Jenis UMKM",
                controller.totalJenisUmkm.value.toString(),
                Icons.category,
                Colors.green,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDashboardCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
