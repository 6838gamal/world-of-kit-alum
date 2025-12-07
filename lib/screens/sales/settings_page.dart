import 'package:flutter/material.dart';

class SalesSettingsPage extends StatelessWidget {
  const SalesSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إعدادات المبيعات ⚙️')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.receipt), title: Text('إعدادات الفواتير')),
          ListTile(leading: Icon(Icons.price_check), title: Text('إعدادات عروض الأسعار')),
          ListTile(leading: Icon(Icons.notifications), title: Text('إشعارات')),
          ListTile(leading: Icon(Icons.payment), title: Text('طرق الدفع')),
          ListTile(leading: Icon(Icons.settings), title: Text('إعدادات عامة')),
        ],
      ),
    );
  }
}
