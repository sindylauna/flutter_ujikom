import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key}) {
    Get.put(DashboardController()); // Initialize the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard UMKM"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.business,
              title: "Operasional",
              onTap: () => Get.toNamed("/operasional"),
            ),
            _buildDrawerItem(
              icon: Icons.event,
              title: "Keuangan",
              onTap: () => Get.toNamed("/keuangan"),
            ),
            _buildDrawerItem(
              icon: Icons.category,
              title: "Jenis UMKM",
              onTap: () => Get.toNamed("/jenisumkm"),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: "Profile",
              onTap: () => Get.toNamed("/profile"),
            ),
            const Divider(), // Divider line
            _buildDrawerItem(
              icon: Icons.exit_to_app,
              title: "Logout",
              color: Colors.red,
              onTap: () {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah Anda yakin ingin logout?",
                  textConfirm: "Ya",
                  textCancel: "Batal",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    Get.find<DashboardController>().logout();
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
          if (Get.find<DashboardController>().isLoading.value) {
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
                Get.find<DashboardController>().totalJenisUmkm.value.toString(),
                Icons.category,
                Colors.green,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      textColor: color,
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
