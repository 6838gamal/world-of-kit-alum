import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  final List<Map<String, dynamic>> accounts = const [
    {"code": "1000", "name": "الأصول", "type": "Assets"},
    {"code": "2000", "name": "الخصوم", "type": "Liabilities"},
    {"code": "3000", "name": "الإيرادات", "type": "Revenue"},
    {"code": "4000", "name": "المصروفات", "type": "Expenses"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.list),
            SizedBox(width: 8),
            Text("Chart of Accounts / دليل الحسابات"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final acc = accounts[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.account_balance, size: 30),
              title: Text(acc['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("رمز الحساب: ${acc['code']} | النوع: ${acc['type']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
