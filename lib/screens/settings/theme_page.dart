import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.palette),
            SizedBox(width: 8),
            Text("Theme & Logo / الشعار والألوان"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("اختر اللون الرئيسي:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: const [
                CircleAvatar(backgroundColor: Colors.blue, radius: 20),
                SizedBox(width: 10),
                CircleAvatar(backgroundColor: Colors.green, radius: 20),
                SizedBox(width: 10),
                CircleAvatar(backgroundColor: Colors.orange, radius: 20),
              ],
            ),
            const SizedBox(height: 20),
            const Text("تحميل شعار جديد:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              onPressed: () {},
              label: const Text("رفع الشعار"),
            ),
          ],
        ),
      ),
    );
  }
}
