import 'package:flutter/material.dart';

class SalesInvoicesPage extends StatelessWidget {
  const SalesInvoicesPage({super.key});

  final List<Map<String, String>> invoices = const [
    {"id": "INV-001", "customer": "شركة ألف", "date": "2025-12-01", "status": "مدفوعة", "total": "5000 ريال"},
    {"id": "INV-002", "customer": "شركة باء", "date": "2025-12-02", "status": "غير مدفوعة", "total": "3200 ريال"},
    {"id": "INV-003", "customer": "شركة جيم", "date": "2025-12-03", "status": "مدفوعة جزئيًا", "total": "7800 ريال"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة الفواتير 🧾')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة فاتورة'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('تصدير PDF'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                  label: const Text('فلترة'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('رقم الفاتورة')),
                    DataColumn(label: Text('العميل')),
                    DataColumn(label: Text('التاريخ')),
                    DataColumn(label: Text('الحالة')),
                    DataColumn(label: Text('المجموع')),
                    DataColumn(label: Text('إجراءات')),
                  ],
                  rows: invoices.map((invoice) {
                    return DataRow(cells: [
                      DataCell(Text(invoice["id"]!)),
                      DataCell(Text(invoice["customer"]!)),
                      DataCell(Text(invoice["date"]!)),
                      DataCell(Text(invoice["status"]!)),
                      DataCell(Text(invoice["total"]!)),
                      DataCell(Row(
                        children: [
                          IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.print, color: Colors.green), onPressed: () {}),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
