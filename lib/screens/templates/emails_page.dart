import 'package:flutter/material.dart';

class EmailTemplatesPage extends StatelessWidget {
  const EmailTemplatesPage({super.key});

  final List<Map<String, dynamic>> emails = const [
    {"name": "تأكيد الطلب", "subject": "Order Confirmation", "lastModified": "2025-04-01"},
    {"name": "تذكير الدفع", "subject": "Payment Reminder", "lastModified": "2025-03-28"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.email),
            SizedBox(width: 8),
            Text("Email Templates / قوالب البريد الإلكتروني"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.mark_email_read),
              title: Text(email['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("الموضوع: ${email['subject']} | آخر تعديل: ${email['lastModified']}"),
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
