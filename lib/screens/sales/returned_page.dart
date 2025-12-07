import 'package:flutter/material.dart';

class ReturnedInvoicesPage extends StatelessWidget {
  const ReturnedInvoicesPage({super.key});

  final List<Map<String, String>> returnedInvoices = const [
    {"id": "R-001", "customer": "شركة ألف", "date": "2025-12-01", "total": "500 ريال"},
    {"id": "R-002", "customer": "شركة باء", "date": "2025-12-03", "total": "1200 ريال"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الفواتير المرتجعة ↩️')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('رقم الفاتورة')),
              DataColumn(label: Text('العميل')),
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('المجموع')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: returnedInvoices.map((invoice) {
              return DataRow(cells: [
                DataCell(Text(invoice["id"]!)),
                DataCell(Text(invoice["customer"]!)),
                DataCell(Text(invoice["date"]!)),
                DataCell(Text(invoice["total"]!)),
                DataCell(Row(
                  children: [
                    IconButton(icon: const Icon(Icons.visibility, color: Colors.blue), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                  ],
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
