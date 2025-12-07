import 'package:flutter/material.dart';

class CreateInvoicePage extends StatelessWidget {
  const CreateInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء فاتورة 🧾➕')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'اسم العميل')),
            TextField(decoration: const InputDecoration(labelText: 'تاريخ الفاتورة')),
            TextField(decoration: const InputDecoration(labelText: 'المجموع')),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('حفظ الفاتورة'),
            ),
          ],
        ),
      ),
    );
  }
}
