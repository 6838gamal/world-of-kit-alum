import 'package:flutter/material.dart';

class SerialSettingsPage extends StatelessWidget {
  const SerialSettingsPage({super.key});

  final List<Map<String, dynamic>> serials = const [
    {"module": "الفواتير", "prefix": "INV-", "next": 1001},
    {"module": "المشتريات", "prefix": "BILL-", "next": 502},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.confirmation_number),
            SizedBox(width: 8),
            Text("Serial Settings / إعدادات الترقيم"),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: serials.length,
        itemBuilder: (context, index) {
          final serial = serials[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.format_list_numbered),
              title: Text(serial['module'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("البادئة: ${serial['prefix']} | الرقم التالي: ${serial['next']}"),
              trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
