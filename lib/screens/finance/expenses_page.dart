import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> expenses = [
    {
      "no": "EXP-001",
      "title": "فاتورة كهرباء",
      "category": "خدمات",
      "amount": 15000,
      "currency": "ر.ي",
      "date": "2025-04-01",
      "status": "مدفوع",
      "notes": "فاتورة شهر مارس"
    },
    {
      "no": "EXP-002",
      "title": "شراء مواد مكتبية",
      "category": "مشتريات",
      "amount": 42000,
      "currency": "ر.ي",
      "date": "2025-04-03",
      "status": "معلّق",
      "notes": "للمكتب الرئيسي"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.money_off),
            SizedBox(width: 8),
            Text("Expenses / المصروفات"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'إضافة مصروف',
            onPressed: () {
              _openAddExpenseDialog(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 15),
            Expanded(child: _buildExpensesTable()),
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
              labelText: "بحث عن مصروف أو فئة",
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

  Widget _buildExpensesTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
        columns: const [
          DataColumn(label: Row(children: [Icon(Icons.numbers, size: 18), SizedBox(width: 5), Text("رقم المصروف")])),
          DataColumn(label: Row(children: [Icon(Icons.description, size: 18), SizedBox(width: 5), Text("العنوان")])),
          DataColumn(label: Row(children: [Icon(Icons.category, size: 18), SizedBox(width: 5), Text("الفئة")])),
          DataColumn(label: Row(children: [Icon(Icons.attach_money, size: 18), SizedBox(width: 5), Text("المبلغ")])),
          DataColumn(label: Row(children: [Icon(Icons.date_range, size: 18), SizedBox(width: 5), Text("التاريخ")])),
          DataColumn(label: Row(children: [Icon(Icons.verified, size: 18), SizedBox(width: 5), Text("الحالة")])),
          DataColumn(label: Row(children: [Icon(Icons.note, size: 18), SizedBox(width: 5), Text("ملاحظات")])),
          DataColumn(label: Row(children: [Icon(Icons.settings, size: 18), SizedBox(width: 5), Text("إجراءات")])),
        ],
        rows: expenses.map(
          (exp) => DataRow(cells: [
            DataCell(Text(exp['no'])),
            DataCell(Text(exp['title'])),
            DataCell(Text(exp['category'])),
            DataCell(Text("${exp['amount']} ${exp['currency']}")),
            DataCell(Text(exp['date'])),
            DataCell(
              Chip(
                label: Text(exp['status']),
                avatar: Icon(
                  exp['status'] == 'مدفوع' ? Icons.check_circle : Icons.hourglass_top,
                  color: exp['status'] == 'مدفوع' ? Colors.green : Colors.orange,
                ),
              ),
            ),
            DataCell(Text(exp['notes'])),
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

  void _openAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إضافة مصروف جديد"),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "عنوان المصروف",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category),
                  labelText: "الفئة",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                  labelText: "المبلغ",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  labelText: "ملاحظات",
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
