import 'package:flutter/material.dart';

class CreditNotePage extends StatelessWidget {
  const CreditNotePage({super.key});

  final List<Map<String, String>> notes = const [
    {"id": "CN-001", "customer": "شركة ألف", "amount": "200 ريال", "date": "2025-12-01"},
    {"id": "CN-002", "customer": "شركة باء", "amount": "500 ريال", "date": "2025-12-02"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إشعارات دائنة 💳')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('رقم الإشعار')),
              DataColumn(label: Text('العميل')),
              DataColumn(label: Text('المبلغ')),
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: notes.map((note) {
              return DataRow(cells: [
                DataCell(Text(note["id"]!)),
                DataCell(Text(note["customer"]!)),
                DataCell(Text(note["amount"]!)),
                DataCell(Text(note["date"]!)),
                DataCell(Row(
                  children: [
                    IconButton(icon: const Icon(Icons.print, color: Colors.green), onPressed: () {}),
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
