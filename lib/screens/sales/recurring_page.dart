import 'package:flutter/material.dart';

class RecurringInvoicesPage extends StatelessWidget {
  const RecurringInvoicesPage({super.key});

  final List<Map<String, String>> recurringInvoices = const [
    {"id": "REC-001", "customer": "شركة ألف", "startDate": "2025-12-01", "interval": "شهري", "status": "نشط"},
    {"id": "REC-002", "customer": "شركة باء", "startDate": "2025-12-05", "interval": "ربع سنوي", "status": "متوقف"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الفواتير الدورية 🔄')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('رقم الفاتورة')),
              DataColumn(label: Text('العميل')),
              DataColumn(label: Text('تاريخ البداية')),
              DataColumn(label: Text('الفاصل')),
              DataColumn(label: Text('الحالة')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: recurringInvoices.map((invoice) {
              return DataRow(cells: [
                DataCell(Text(invoice["id"]!)),
                DataCell(Text(invoice["customer"]!)),
                DataCell(Text(invoice["startDate"]!)),
                DataCell(Text(invoice["interval"]!)),
                DataCell(Text(invoice["status"]!)),
                DataCell(Row(
                  children: [
                    IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
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
