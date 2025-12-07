import 'package:flutter/material.dart';

class SalesPaymentsPage extends StatelessWidget {
  const SalesPaymentsPage({super.key});

  final List<Map<String, String>> payments = const [
    {"id": "P-001", "customer": "شركة ألف", "date": "2025-12-01", "amount": "5000 ريال", "method": "نقد"},
    {"id": "P-002", "customer": "شركة باء", "date": "2025-12-03", "amount": "3200 ريال", "method": "تحويل بنكي"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مدفوعات العملاء 💰')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('رقم الدفع')),
              DataColumn(label: Text('العميل')),
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('المبلغ')),
              DataColumn(label: Text('طريقة الدفع')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: payments.map((payment) {
              return DataRow(cells: [
                DataCell(Text(payment["id"]!)),
                DataCell(Text(payment["customer"]!)),
                DataCell(Text(payment["date"]!)),
                DataCell(Text(payment["amount"]!)),
                DataCell(Text(payment["method"]!)),
                DataCell(Row(
                  children: [
                    IconButton(icon: const Icon(Icons.visibility, color: Colors.green), onPressed: () {}),
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
