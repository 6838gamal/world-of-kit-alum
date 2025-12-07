import 'package:flutter/material.dart';

class CostPage extends StatelessWidget {
  const CostPage({super.key});

  final List<Map<String, dynamic>> costCenters = const [
    {"code": "C001", "name": "المخازن"},
    {"code": "C002", "name": "المبيعات"},
    {"code": "C003", "name": "الإنتاج"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.category),
            SizedBox(width: 8),
            Text("Cost Centers / مراكز التكلفة"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: costCenters.length,
        itemBuilder: (context, index) {
          final center = costCenters[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.account_tree, size: 30),
              title: Text(center['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("رمز المركز: ${center['code']}"),
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
