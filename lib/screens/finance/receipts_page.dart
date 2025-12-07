import 'package:flutter/material.dart';

class ReceiptsPage extends StatefulWidget {
  const ReceiptsPage({super.key});

  @override
  State<ReceiptsPage> createState() => _ReceiptsPageState();
}

class _ReceiptsPageState extends State<ReceiptsPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> receipts = [
    {
      "no": "RCPT-001",
      "client": "شركة المستقبل",
      "amount": 2500,
      "currency": "USD",
      "date": "2025-04-01",
      "status": "مدفوع",
      "reference": "INV-4503",
      "method": "نقدي",
      "notes": "دفعة أولى"
    },
    {
      "no": "RCPT-002",
      "client": "مؤسسة الأمان",
      "amount": 1800,
      "currency": "USD",
      "date": "2025-04-03",
      "status": "معلّق",
      "reference": "INV-4410",
      "method": "تحويل بنكي",
      "notes": "دفعة جزئية"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.receipt_long),
            SizedBox(width: 8),
            Text("Receipts / سندات القبض"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'إضافة سند قبض',
            onPressed: () {
              _openAddReceiptDialog(context);
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
            Expanded(child: _buildReceiptsTable()),
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
              labelText: "بحث عن سند أو عميل",
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

  Widget _buildReceiptsTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
        columns: const [
          DataColumn(label: Row(children: [Icon(Icons.numbers, size: 18), SizedBox(width: 5), Text("الرقم")])),
          DataColumn(label: Row(children: [Icon(Icons.business, size: 18), SizedBox(width: 5), Text("العميل")])),
          DataColumn(label: Row(children: [Icon(Icons.attach_money, size: 18), SizedBox(width: 5), Text("المبلغ")])),
          DataColumn(label: Row(children: [Icon(Icons.date_range, size: 18), SizedBox(width: 5), Text("التاريخ")])),
          DataColumn(label: Row(children: [Icon(Icons.verified, size: 18), SizedBox(width: 5), Text("الحالة")])),
          DataColumn(label: Row(children: [Icon(Icons.link, size: 18), SizedBox(width: 5), Text("المرجع")])),
          DataColumn(label: Row(children: [Icon(Icons.payment, size: 18), SizedBox(width: 5), Text("طريقة الدفع")])),
          DataColumn(label: Row(children: [Icon(Icons.note, size: 18), SizedBox(width: 5), Text("ملاحظات")])),
          DataColumn(label: Row(children: [Icon(Icons.settings, size: 18), SizedBox(width: 5), Text("إجراءات")])),
        ],
        rows: receipts.map(
          (rcpt) => DataRow(cells: [
            DataCell(Text(rcpt['no'])),
            DataCell(Text(rcpt['client'])),
            DataCell(Text("${rcpt['amount']} ${rcpt['currency']}")),
            DataCell(Text(rcpt['date'])),
            DataCell(
              Chip(
                label: Text(rcpt['status']),
                avatar: Icon(
                  rcpt['status'] == 'مدفوع' ? Icons.check_circle : Icons.hourglass_top,
                  color: rcpt['status'] == 'مدفوع' ? Colors.green : Colors.orange,
                ),
              ),
            ),
            DataCell(Text(rcpt['reference'])),
            DataCell(Text(rcpt['method'])),
            DataCell(Text(rcpt['notes'])),
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

  void _openAddReceiptDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إضافة سند قبض جديد"),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  labelText: "اسم العميل",
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
                  prefixIcon: Icon(Icons.payment),
                  labelText: "طريقة الدفع",
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
