import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  final List<Map<String, dynamic>> assets = const [
    {"code": "A001", "name": "مبنى الشركة", "value": 2000000},
    {"code": "A002", "name": "أجهزة الكمبيوتر", "value": 150000},
    {"code": "A003", "name": "الأثاث", "value": 50000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home_work),
            SizedBox(width: 8),
            Text("Assets / الأصول"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: assets.length,
        itemBuilder: (context, index) {
          final asset = assets[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet, size: 30),
              title: Text(asset['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("رمز الأصل: ${asset['code']} | القيمة: ${asset['value']} ر.ي"),
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
