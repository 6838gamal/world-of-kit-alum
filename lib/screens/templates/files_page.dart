import 'package:flutter/material.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  final List<Map<String, dynamic>> files = const [
    {"name": "عقد الموردين.pdf", "size": "250KB", "lastModified": "2025-03-28"},
    {"name": "قائمة الأسعار.xlsx", "size": "120KB", "lastModified": "2025-03-25"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.folder),
            SizedBox(width: 8),
            Text("Files / إدارة الملفات"),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.upload_file), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(file['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("الحجم: ${file['size']} | آخر تعديل: ${file['lastModified']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.download), onPressed: () {}),
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
