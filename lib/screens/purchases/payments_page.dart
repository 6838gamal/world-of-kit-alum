import 'package:flutter/material.dart';

class PurchasePaymentsPage extends StatefulWidget {
  const PurchasePaymentsPage({super.key});

  @override
  State<PurchasePaymentsPage> createState() => _PurchasePaymentsPageState();
}

class _PurchasePaymentsPageState extends State<PurchasePaymentsPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> payments = [
    {
      "no": "PMT-001",
      "supplier": "شركة الإمداد",
      "method": "نقدي",
      "amount": 1200,
      "currency": "USD",
      "date": "2025-03-01",
      "status": "مدفوع",
      "reference": "INV-554",
    },
    {
      "no": "PMT-002",
      "supplier": "مؤسسة المستقبل",
      "method": "تحويل بنكي",
      "amount": 3500,
      "currency": "USD",
      "date": "2025-03-02",
      "status": "معلّق",
      "reference": "INV-555",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.payments),
            SizedBox(width: 8),
            Text("Payments | المدفوعات"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'إضافة عملية دفع',
            onPressed: () {
              _openAddPaymentDialog(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildTopBar(),
            const SizedBox(height: 15),
            Expanded(child: _buildPaymentsTable()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: "بحث عن عملية دفع أو مورد",
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

  Widget _buildPaymentsTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 25,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
        columns: const [
          DataColumn(label: Row(children: [Icon(Icons.numbers, size: 18), SizedBox(width: 5), Text("الرقم")])) ,
          DataColumn(label: Row(children: [Icon(Icons.business, size: 18), SizedBox(width: 5), Text("المورد")])) ,
          DataColumn(label: Row(children: [Icon(Icons.payment, size: 18), SizedBox(width: 5), Text("الطريقة")])) ,
          DataColumn(label: Row(children: [Icon(Icons.attach_money, size: 18), SizedBox(width: 5), Text("المبلغ")])) ,
          DataColumn(label: Row(children: [Icon(Icons.date_range, size: 18), SizedBox(width: 5), Text("التاريخ")])) ,
          DataColumn(label: Row(children: [Icon(Icons.verified, size: 18), SizedBox(width: 5), Text("الحالة")])) ,
          DataColumn(label: Row(children: [Icon(Icons.link, size: 18), SizedBox(width: 5), Text("المرجع")])) ,
          DataColumn(label: Row(children: [Icon(Icons.settings, size: 18), SizedBox(width: 5), Text("إجراءات")])) ,
        ],
        rows: payments
            .map(
              (payment) => DataRow(cells: [
                DataCell(Text(payment['no'])),
                DataCell(Text(payment['supplier'])),
                DataCell(Text(payment['method'])),
                DataCell(Text("${payment['amount']} ${payment['currency']}")),
                DataCell(Text(payment['date'])),
                DataCell(
                  Chip(
                    label: Text(payment['status']),
                    avatar: Icon(
                      payment['status'] == 'مدفوع' ? Icons.check_circle : Icons.hourglass_top,
                      color: payment['status'] == 'مدفوع' ? Colors.green : Colors.orange,
                    ),
                  ),
                ),
                DataCell(Text(payment['reference'])),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                )),
              ]),
            )
            .toList(),
      ),
    );
  }

  void _openAddPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إضافة عملية دفع جديدة"),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  labelText: "اسم المورد",
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
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
