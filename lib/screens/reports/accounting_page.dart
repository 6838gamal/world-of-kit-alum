import 'package:flutter/material.dart';

class AccountingReportPage extends StatelessWidget {
  const AccountingReportPage({super.key});

  final List<Map<String, dynamic>> journalSummary = const [
    {"date": "2025-04-01", "debit": 50000, "credit": 30000},
    {"date": "2025-04-02", "debit": 42000, "credit": 42000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.account_balance),
            SizedBox(width: 8),
            Text("Accounting Reports / تقارير الحسابات العامة"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("التاريخ")),
            DataColumn(label: Text("المدين")),
            DataColumn(label: Text("الدائن")),
          ],
          rows: journalSummary.map(
            (entry) => DataRow(
              cells: [
                DataCell(Text(entry['date'])),
                DataCell(Text("${entry['debit']} ر.ي")),
                DataCell(Text("${entry['credit']} ر.ي")),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
