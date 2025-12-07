import 'package:flutter/material.dart';

class InventoryReportPage extends StatelessWidget {
  const InventoryReportPage({super.key});

  final List<Map<String, dynamic>> inventoryReport = const [
    {"product": "حاسوب محمول", "quantity": 10, "warehouse": "المخزن الرئيسي"},
    {"product": "طابعة", "quantity": 5, "warehouse": "المخزن الفرعي"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.inventory),
            SizedBox(width: 8),
            Text("Inventory Reports / تقارير المخزون"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("المنتج")),
            DataColumn(label: Text("الكمية")),
            DataColumn(label: Text("المخزن")),
          ],
          rows: inventoryReport.map(
            (entry) => DataRow(
              cells: [
                DataCell(Text(entry['product'])),
                DataCell(Text("${entry['quantity']}")),
                DataCell(Text(entry['warehouse'])),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
