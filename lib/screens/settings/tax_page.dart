import 'package:flutter/material.dart';

class TaxSettingsPage extends StatelessWidget {
  const TaxSettingsPage({super.key});

  final List<Map<String, dynamic>> taxes = const [
    {"name": "ضريبة القيمة المضافة", "rate": "15%", "status": "مفعل"},
    {"name": "ضريبة الخدمات", "rate": "5%", "status": "معطل"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.percent),
            SizedBox(width: 8),
            Text("Tax Settings / إعدادات الضرائب"),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: taxes.length,
        itemBuilder: (context, index) {
          final tax = taxes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text(tax['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("النسبة: ${tax['rate']} | الحالة: ${tax['status']}"),
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
        tooltip: "إضافة ضريبة",
      ),
    );
  }
}
