import 'package:flutter/material.dart';

class ActivityReportPage extends StatelessWidget {
  const ActivityReportPage({super.key});

  final List<Map<String, dynamic>> activities = const [
    {"user": "أحمد صالح", "action": "أضاف فاتورة", "date": "2025-04-01 10:00"},
    {"user": "سارة علي", "action": "عدل بيانات العميل", "date": "2025-04-01 11:15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.history),
            SizedBox(width: 8),
            Text("Activity Log / سجل النشاطات"),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final act = activities[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text("${act['user']}"),
              subtitle: Text("${act['action']}"),
              trailing: Text("${act['date']}"),
            ),
          );
        },
      ),
    );
  }
}
