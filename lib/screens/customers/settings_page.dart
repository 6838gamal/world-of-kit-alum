import 'package:flutter/material.dart';

class CustomerSettingsPage extends StatelessWidget {
  const CustomerSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool allowNegative = true;
    bool autoCode = true;

    return Scaffold(
      appBar: AppBar(title: const Text("إعدادات العملاء ⚙️")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [

          SwitchListTile(
            value: allowNegative,
            title: const Text("السماح برصيد سالب 💳"),
            subtitle: const Text("تمكين أو تعطيل الديون للعملاء"),
            secondary: const Icon(Icons.money_off),
            onChanged: (v) {},
          ),

          SwitchListTile(
            value: autoCode,
            title: const Text("توليد رقم عميل تلقائي 🔢"),
            subtitle: const Text("ترقيم تلقائي للعملاء الجدد"),
            secondary: const Icon(Icons.auto_awesome),
            onChanged: (v) {},
          ),

          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: const Text("تعديل طريقة الترقيم"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("تصنيفات العملاء"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("العملاء المحظورون 🚫"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

        ]),
      ),
    );
  }
}
