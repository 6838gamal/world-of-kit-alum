import 'package:flutter/material.dart';

class ApiSettingsPage extends StatelessWidget {
  const ApiSettingsPage({super.key});

  final List<Map<String, dynamic>> apis = const [
    {"name": "API للمبيعات", "endpoint": "/api/sales", "status": "مفعل"},
    {"name": "API للعملاء", "endpoint": "/api/customers", "status": "مفعل"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.api),
            SizedBox(width: 8),
            Text("API Settings / إعدادات API"),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: apis.length,
        itemBuilder: (context, index) {
          final api = apis[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.cloud),
              title: Text(api['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("النقطة النهائية: ${api['endpoint']} | الحالة: ${api['status']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: "إضافة API جديد",
      ),
    );
  }
}
