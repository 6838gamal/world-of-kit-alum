import 'package:flutter/material.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  final List<Map<String, String>> quotes = const [
    {"id": "Q-001", "customer": "شركة ألف", "date": "2025-12-01", "total": "10000 ريال"},
    {"id": "Q-002", "customer": "شركة باء", "date": "2025-12-02", "total": "15000 ريال"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عروض الأسعار 📑')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('رقم العرض')),
              DataColumn(label: Text('العميل')),
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('المجموع')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: quotes.map((quote) {
              return DataRow(cells: [
                DataCell(Text(quote["id"]!)),
                DataCell(Text(quote["customer"]!)),
                DataCell(Text(quote["date"]!)),
                DataCell(Text(quote["total"]!)),
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
