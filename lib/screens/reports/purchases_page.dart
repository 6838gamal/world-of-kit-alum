import 'package:flutter/material.dart';

class PurchasesReportPage extends StatelessWidget {
  const PurchasesReportPage({super.key});

  final List<Map<String, dynamic>> purchaseReports = const [
    {
      "billNo": "BILL-001",
      "supplier": "المورد الأول",
      "date": "2025-04-01",
      "total": 1200,
      "status": "مدفوع"
    },
    {
      "billNo": "BILL-002",
      "supplier": "المورد الثاني",
      "date": "2025-04-03",
      "total": 950,
      "status": "معلّق"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 8),
            Text("Purchases Reports / تقارير المشتريات"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("رقم الفاتورة")),
            DataColumn(label: Text("المورد")),
            DataColumn(label: Text("التاريخ")),
            DataColumn(label: Text("الإجمالي")),
            DataColumn(label: Text("الحالة")),
          ],
          rows: purchaseReports.map(
            (rpt) => DataRow(
              cells: [
                DataCell(Text(rpt['billNo'])),
                DataCell(Text(rpt['supplier'])),
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
