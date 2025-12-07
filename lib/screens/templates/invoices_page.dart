import 'package:flutter/material.dart';

class InvoiceTemplatesPage extends StatelessWidget {
  const InvoiceTemplatesPage({super.key});

  final List<Map<String, dynamic>> invoices = const [
    {"name": "فاتورة عميل", "layout": "أفقي", "lastModified": "2025-04-02"},
    {"name": "فاتورة مورد", "layout": "عمودي", "lastModified": "2025-03-30"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.receipt),
            SizedBox(width: 8),
            Text("Invoice Templates / قوالب الفواتير"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.file_copy),
              title: Text(invoice['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("التنسيق: ${invoice['layout']} | آخر تعديل: ${invoice['lastModified']}"),
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
