import 'package:flutter/material.dart';

class AutomationPage extends StatelessWidget {
  const AutomationPage({super.key});

  final List<Map<String, dynamic>> automations = const [
    {"name": "إرسال فاتورة يومية", "trigger": "كل يوم الساعة 08:00"},
    {"name": "تذكير الدفع أسبوعي", "trigger": "كل يوم اثنين الساعة 09:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.autorenew),
            SizedBox(width: 8),
            Text("Automation / الإرسال الآلي"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: automations.length,
        itemBuilder: (context, index) {
          final auto = automations[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.schedule),
              title: Text(auto['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("التنشيط: ${auto['trigger']}"),
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
