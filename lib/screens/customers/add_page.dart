import 'package:flutter/material.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();
    final city = TextEditingController();
    final address = TextEditingController();
    final notes = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("إضافة عميل جديد ➕")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [

          _field("اسم العميل 👤", Icons.person, name),
          _field("رقم الهاتف 📞", Icons.phone, phone),
          _field("البريد الإلكتروني 📧", Icons.email, email),
          _field("المدينة 🏙️", Icons.location_city, city),
          _field("العنوان 📍", Icons.place, address),
          _field("ملاحظات 📝", Icons.sticky_note_2, notes, maxLines: 3),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text("حفظ العميل"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ تم حفظ بيانات العميل")),
              );
              Navigator.pop(context);
            },
          )
        ]),
      ),
    );
  }

  Widget _field(String label, IconData icon, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
