import 'package:flutter/material.dart';

class PurchaseReturnsPage extends StatelessWidget {
  const PurchaseReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> returns = [
      {
        "number": "PR-2001",
        "supplier": "Yemen Tech Co.",
        "originalBill": "PB-1001",
        "date": "2024-06-18",
        "items": 5,
        "refund": 600,
        "status": "Approved"
      },
      {
        "number": "PR-2002",
        "supplier": "Alpha Suppliers",
        "originalBill": "PB-1002",
        "date": "2024-06-19",
        "items": 2,
        "refund": 240,
        "status": "Pending"
      },
      {
        "number": "PR-2003",
        "supplier": "Smart House",
        "originalBill": "PB-1003",
        "date": "2024-06-20",
        "items": 8,
        "refund": 1100,
        "status": "Rejected"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.assignment_return),
            SizedBox(width: 8),
            Text("Purchase Returns / مرتجعات المشتريات"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              // الانتقال إلى شاشة إنشاء مرتجع جديد
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            // ===== Search Bar =====
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search by return number or supplier...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ===== Returns List =====
            Expanded(
              child: ListView.builder(
                itemCount: returns.length,
                itemBuilder: (context, index) {
                  final ret = returns[index];

                  Color statusColor = Colors.orange;
                  if (ret['status'] == "Approved") {
                    statusColor = Colors.green;
                  } else if (ret['status'] == "Rejected") {
                    statusColor = Colors.red;
                  }

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.undo, color: Colors.white),
                      ),
                      title: Text(
                        ret['number'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.store, size: 16),
                              const SizedBox(width: 5),
                              Text("Supplier: ${ret['supplier']}"),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.receipt_long, size: 16),
                              const SizedBox(width: 5),
                              Text("Original Bill: ${ret['originalBill']}"),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.date_range, size: 16),
                              const SizedBox(width: 5),
                              Text("Date: ${ret['date']}"),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.inventory_2, size: 16),
                              const SizedBox(width: 5),
                              Text("Items: ${ret['items']}"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, size: 16),
                              const SizedBox(width: 5),
                              Text("Refund: ${ret['refund']} \$"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ret['status'],
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {
                              // الانتقال إلى تفاصيل المرتجع
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

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Create new return
        },
      ),
    );
  }
}
