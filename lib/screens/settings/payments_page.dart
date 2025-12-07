import 'package:flutter/material.dart';

class PaymentsSettingsPage extends StatelessWidget {
  const PaymentsSettingsPage({super.key});

  // قائمة طرق الدفع
  final List<Map<String, dynamic>> paymentMethods = const [
    {"name": "نقدي", "status": "مفعل", "description": "الدفع النقدي مباشرة عند الاستلام"},
    {"name": "تحويل بنكي", "status": "مفعل", "description": "الدفع عن طريق الحساب البنكي"},
    {"name": "باي بال", "status": "معطل", "description": "الدفع عبر باي بال"},
    {"name": "بطاقة ائتمان", "status": "مفعل", "description": "الدفع عبر الفيزا أو الماستركارد"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.payment),
            SizedBox(width: 8),
            Text("Payment Methods / طرق الدفع"),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.credit_card),
              title: Text(method['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الحالة: ${method['status']}"),
                  Text("الوصف: ${method['description']}"),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("إضافة طريقة دفع"),
      ),
    );
  }
}
