import 'package:flutter/material.dart';

class CustomersReportPage extends StatelessWidget {
  const CustomersReportPage({super.key});

  final List<Map<String, dynamic>> customersReport = const [
    {"name": "شركة المستقبل", "totalSales": 2500, "lastInvoice": "2025-04-01"},
    {"name": "مؤسسة الأمان", "totalSales": 1800, "lastInvoice": "2025-04-03"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Text("Customers Reports / تقارير العملاء"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("العميل")),
            DataColumn(label: Text("إجمالي المبيعات")),
            DataColumn(label: Text("آخر فاتورة")),
          ],
          rows: customersReport.map(
            (entry) => DataRow(
              cells: [
                DataCell(Text(entry['name'])),
                DataCell(Text("${entry['totalSales']} ر.ي")),
                DataCell(Text(entry['lastInvoice'])),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
