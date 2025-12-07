import 'package:flutter/material.dart';

class PurchaseBillsPage extends StatelessWidget {
  const PurchaseBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bills = [
      {
        "number": "PB-1001",
        "supplier": "Yemen Tech Co.",
        "date": "2024-06-10",
        "total": 3200.00,
        "paid": 2000.00,
        "status": "Partially Paid"
      },
      {
        "number": "PB-1002",
        "supplier": "Alpha Suppliers",
        "date": "2024-06-12",
        "total": 1500.00,
        "paid": 1500.00,
        "status": "Paid"
      },
      {
        "number": "PB-1003",
        "supplier": "Smart House",
        "date": "2024-06-15",
        "total": 4200.00,
        "paid": 0.00,
        "status": "Unpaid"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.receipt_long),
            SizedBox(width: 8),
            Text("Purchase Bills / فواتير الشراء"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              // الانتقال إلى شاشة إنشاء فاتورة شراء
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            // ===== Search & Filter =====
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search by bill number or supplier...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ===== Bills List =====
            Expanded(
              child: ListView.builder(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];

                  Color statusColor = Colors.orange;
                  if (bill['status'] == "Paid") {
                    statusColor = Colors.green;
                  } else if (bill['status'] == "Unpaid") {
                    statusColor = Colors.red;
                  }

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.receipt, color: Colors.white),
                      ),
                      title: Text(
                        bill['number'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.store, size: 16),
                              const SizedBox(width: 5),
                              Text("Supplier: ${bill['supplier']}"),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.date_range, size: 16),
                              const SizedBox(width: 5),
                              Text("Date: ${bill['date']}"),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, size: 16),
                              const SizedBox(width: 5),
                              Text("Total: ${bill['total']} \$"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.payments, size: 16),
                              const SizedBox(width: 5),
                              Text("Paid: ${bill['paid']} \$"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bill['status'],
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {
                              // الانتقال إلى تفاصيل فاتورة الشراء
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ===== Floating Button =====
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Create new purchase bill
        },
      ),
    );
  }
}
