import 'package:flutter/material.dart';

class CustomersContactsPage extends StatelessWidget {
  const CustomersContactsPage({super.key});

  final List<Map<String, String>> contacts = const [
    {"company": "شركة الأفق", "phone": "771111111", "email": "info@ufuq.com"},
    {"company": "مؤسسة النور", "phone": "772222222", "email": "noor@co.com"},
    {"company": "متجر الريان", "phone": "773333333", "email": "reyan@shop.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("قائمة الاتصال 📱")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final c = contacts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.business)),
              title: Text(c["company"]!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("📞 ${c["phone"]}"),
                  Text("📧 ${c["email"]}"),
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 1, child: Text("اتصال 📞")),
                  PopupMenuItem(value: 2, child: Text("إرسال رسالة 💬")),
                  PopupMenuItem(value: 3, child: Text("فتح الملف 📁")),
                ],
                onSelected: (val) {
                  if (val == 3) {
                    Navigator.pushNamed(context, '/customers/profile');
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
