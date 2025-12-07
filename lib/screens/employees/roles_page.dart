import 'package:flutter/material.dart';

class RolesPage extends StatelessWidget {
  const RolesPage({super.key});

  final List<Map<String, dynamic>> roles = const [
    {"name": "مدير النظام", "permissions": "كل الصلاحيات"},
    {"name": "محاسب", "permissions": "المالية فقط"},
    {"name": "مسؤول المخزون", "permissions": "المخزون فقط"},
    {"name": "مبيعات", "permissions": "المبيعات فقط"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.admin_panel_settings),
            SizedBox(width: 8),
            Text("Roles / أدوار الموظفين"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final role = roles[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.shield, size: 30),
              title: Text(role['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("الصلاحيات: ${role['permissions']}"),
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
