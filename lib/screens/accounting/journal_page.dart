import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  final List<Map<String, dynamic>> journalEntries = const [
    {
      "no": "JE-001",
      "date": "2025-04-01",
      "account": "الصندوق",
      "description": "إيداع نقدي",
      "debit": 50000,
      "credit": 0
    },
    {
      "no": "JE-002",
      "date": "2025-04-02",
      "account": "المشتريات",
      "description": "شراء مواد مكتبية",
      "debit": 0,
      "credit": 42000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.book),
            SizedBox(width: 8),
            Text("Journal / القيود اليومية"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20,
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Row(children: [Icon(Icons.numbers, size: 18), SizedBox(width: 5), Text("رقم القيد")])),
            DataColumn(label: Row(children: [Icon(Icons.date_range, size: 18), SizedBox(width: 5), Text("التاريخ")])),
            DataColumn(label: Row(children: [Icon(Icons.account_balance_wallet, size: 18), SizedBox(width: 5), Text("الحساب")])),
            DataColumn(label: Row(children: [Icon(Icons.description, size: 18), SizedBox(width: 5), Text("الوصف")])),
            DataColumn(label: Row(children: [Icon(Icons.arrow_downward, size: 18), SizedBox(width: 5), Text("مدين")])),
            DataColumn(label: Row(children: [Icon(Icons.arrow_upward, size: 18), SizedBox(width: 5), Text("دائن")])),
          ],
          rows: journalEntries.map((entry) {
            return DataRow(cells: [
              DataCell(Text(entry['no'])),
              DataCell(Text(entry['date'])),
              DataCell(Text(entry['account'])),
              DataCell(Text(entry['description'])),
              DataCell(Text("${entry['debit']} ر.ي")),
              DataCell(Text("${entry['credit']} ر.ي")),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
