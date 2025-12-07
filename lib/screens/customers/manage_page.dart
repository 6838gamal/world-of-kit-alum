import 'package:flutter/material.dart';

class CustomersManagePage extends StatelessWidget {
  const CustomersManagePage({super.key});

  final List<Map<String, dynamic>> customers = const [
    {"name": "شركة الأفق", "phone": "+967771111111", "city": "تعز", "balance": 12000},
    {"name": "مؤسسة النور", "phone": "+967772222222", "city": "صنعاء", "balance": -3500},
    {"name": "متجر الريان", "phone": "+967773333333", "city": "عدن", "balance": 0},
  ];

  Color _balanceColor(num b) {
    if (b > 0) return Colors.green;
    if (b < 0) return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إدارة العملاء 👥"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            tooltip: "إضافة عميل جديد",
            icon: const Icon(Icons.person_add_alt_1),
            onPressed: () => Navigator.pushNamed(context, '/customers/add'),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [

          // شريط البحث
          TextField(
            decoration: InputDecoration(
              hintText: "بحث باسم العميل أو الرقم 📞",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),

          const SizedBox(height: 16),

          // جدول العملاء
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 18,
                columns: const [
                  DataColumn(label: Text("👤 الاسم")),
                  DataColumn(label: Text("📞 الهاتف")),
                  DataColumn(label: Text("🏙️ المدينة")),
                  DataColumn(label: Text("💳 الرصيد")),
                  DataColumn(label: Text("⚡ إجراءات")),
                ],
                rows: customers.map((c) {
                  return DataRow(
                    cells: [
                      DataCell(Text(c["name"])),
                      DataCell(Text(c["phone"])),
                      DataCell(Text(c["city"])),
                      DataCell(Text(
                        c["balance"].toString(),
                        style: TextStyle(color: _balanceColor(c["balance"])),
                      )),
                      DataCell(Row(
                        children: [
                          IconButton(
                            tooltip: "ملف العميل",
                            icon: const Icon(Icons.folder_open, color: Colors.blue),
                            onPressed: () {
                              Navigator.pushNamed(context, '/customers/profile');
                            },
                          ),
                          IconButton(
                            tooltip: "تعديل",
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              Navigator.pushNamed(context, '/customers/edit');
                            },
                          ),
                          IconButton(
                            tooltip: "حذف",
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
