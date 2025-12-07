import 'package:flutter/material.dart';

class ManageEmployeesPage extends StatefulWidget {
  const ManageEmployeesPage({super.key});

  @override
  State<ManageEmployeesPage> createState() => _ManageEmployeesPageState();
}

class _ManageEmployeesPageState extends State<ManageEmployeesPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> employees = [
    {
      "id": "EMP-001",
      "name": "أحمد صالح",
      "position": "محاسب",
      "department": "المالية",
      "email": "ahmed@example.com",
      "phone": "777123456",
      "status": "نشط"
    },
    {
      "id": "EMP-002",
      "name": "سارة علي",
      "position": "مسؤول مخزون",
      "department": "المخزون",
      "email": "sara@example.com",
      "phone": "777654321",
      "status": "معلّق"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.group),
            SizedBox(width: 8),
            Text("Employees / إدارة الموظفين"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'إضافة موظف',
            onPressed: () {
              _openAddEmployeeDialog(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 15),
            Expanded(child: _buildEmployeesTable()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: "بحث عن موظف أو قسم",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
          label: const Text("فلترة"),
        )
      ],
    );
  }

  Widget _buildEmployeesTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
        columns: const [
          DataColumn(label: Row(children: [Icon(Icons.badge, size: 18), SizedBox(width: 5), Text("رقم الموظف")])),
          DataColumn(label: Row(children: [Icon(Icons.person, size: 18), SizedBox(width: 5), Text("الاسم")])),
          DataColumn(label: Row(children: [Icon(Icons.work, size: 18), SizedBox(width: 5), Text("الوظيفة")])),
          DataColumn(label: Row(children: [Icon(Icons.business, size: 18), SizedBox(width: 5), Text("القسم")])),
          DataColumn(label: Row(children: [Icon(Icons.email, size: 18), SizedBox(width: 5), Text("البريد الإلكتروني")])),
          DataColumn(label: Row(children: [Icon(Icons.phone, size: 18), SizedBox(width: 5), Text("الهاتف")])),
          DataColumn(label: Row(children: [Icon(Icons.verified, size: 18), SizedBox(width: 5), Text("الحالة")])),
          DataColumn(label: Row(children: [Icon(Icons.settings, size: 18), SizedBox(width: 5), Text("إجراءات")])),
        ],
        rows: employees.map(
          (emp) => DataRow(cells: [
            DataCell(Text(emp['id'])),
            DataCell(Text(emp['name'])),
            DataCell(Text(emp['position'])),
            DataCell(Text(emp['department'])),
            DataCell(Text(emp['email'])),
            DataCell(Text(emp['phone'])),
            DataCell(
              Chip(
                label: Text(emp['status']),
                avatar: Icon(
                  emp['status'] == 'نشط' ? Icons.check_circle : Icons.hourglass_top,
                  color: emp['status'] == 'نشط' ? Colors.green : Colors.orange,
                ),
              ),
            ),
            DataCell(Row(
              children: [
                IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
                IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
              ],
            )),
          ]),
        ).toList(),
      ),
    );
  }

  void _openAddEmployeeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إضافة موظف جديد"),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "اسم الموظف",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.work),
                  labelText: "الوظيفة",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  labelText: "القسم",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "البريد الإلكتروني",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "الهاتف",
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () => Navigator.pop(context),
            label: const Text("حفظ"),
          ),
        ],
      ),
    );
  }
}
