import 'package:flutter/material.dart';

class PrintTemplatesPage extends StatelessWidget {
  const PrintTemplatesPage({super.key});

  final List<Map<String, dynamic>> templates = const [
    {"name": "قالب فاتورة قياسي", "type": "فاتورة", "lastModified": "2025-04-01"},
    {"name": "قالب عرض سعر", "type": "عرض سعر", "lastModified": "2025-03-28"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.print),
            SizedBox(width: 8),
            Text("Print Templates / قوالب الطباعة"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final temp = templates[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.description),
              title: Text(temp['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("النوع: ${temp['type']} | آخر تعديل: ${temp['lastModified']}"),
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
    );
  }
}
