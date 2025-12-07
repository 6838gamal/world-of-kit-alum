import 'package:flutter/material.dart';

class BanksPage extends StatelessWidget {
  const BanksPage({super.key});

  final List<Map<String, dynamic>> banks = const [
    {
      "name": "بنك الكريمي",
      "accountNo": "123456789",
      "branch": "تعز",
      "currency": "YER",
      "balance": 1250000
    },
    {
      "name": "بنك التضامن",
      "accountNo": "987654321",
      "branch": "صنعاء",
      "currency": "USD",
      "balance": 35000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.account_balance),
            SizedBox(width: 8),
            Text("Banks / الخزائن والحسابات البنكية"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'إضافة حساب بنكي',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: banks.length,
        itemBuilder: (context, index) {
          final bank = banks[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet, size: 30),
              title: Text(bank['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("رقم الحساب: ${bank['accountNo']}"),
                  Text("الفرع: ${bank['branch']}"),
                  Text("العملة: ${bank['currency']}"),
                  Text("الرصيد الحالي: ${bank['balance']}"),
                ],
              ),
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
