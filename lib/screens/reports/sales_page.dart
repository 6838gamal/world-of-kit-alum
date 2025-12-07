import 'package:flutter/material.dart';

class SalesReportPage extends StatelessWidget {
  const SalesReportPage({super.key});

  final List<Map<String, dynamic>> salesReports = const [
    {
      "invoiceNo": "INV-001",
      "client": "شركة المستقبل",
      "date": "2025-04-01",
      "total": 2500,
      "status": "مدفوع"
    },
    {
      "invoiceNo": "INV-002",
      "client": "مؤسسة الأمان",
      "date": "2025-04-03",
      "total": 1800,
      "status": "معلّق"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.bar_chart),
            SizedBox(width: 8),
            Text("Sales Reports / تقارير المبيعات"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("رقم الفاتورة")),
            DataColumn(label: Text("العميل")),
            DataColumn(label: Text("التاريخ")),
            DataColumn(label: Text("الإجمالي")),
            DataColumn(label: Text("الحالة")),
          ],
          rows: salesReports.map(
            (rpt) => DataRow(
              cells: [
                DataCell(Text(rpt['invoiceNo'])),
                DataCell(Text(rpt['client'])),
                DataCell(Text(rpt['date'])),
                DataCell(Text("${rpt['total']} ر.ي")),
                DataCell(
                  Chip(
                    label: Text(rpt['status']),
                    backgroundColor:
                        rpt['status'] == 'مدفوع' ? Colors.green.shade200 : Colors.orange.shade200,
                  ),
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
