import 'package:flutter/material.dart';

class PurchaseDebitNotesPage extends StatelessWidget {
  const PurchaseDebitNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notes = [
      {
        "number": "DN-3001",
        "supplier": "Yemen Tech Co.",
        "relatedBill": "PB-1001",
        "date": "2024-06-21",
        "amount": 850,
        "reason": "Damaged items",
        "status": "Issued"
      },
      {
        "number": "DN-3002",
        "supplier": "Alpha Suppliers",
        "relatedBill": "PB-1002",
        "date": "2024-06-23",
        "amount": 420,
        "reason": "Wrong quantity delivered",
        "status": "Pending"
      },
      {
        "number": "DN-3003",
        "supplier": "Smart House",
        "relatedBill": "PB-1003",
        "date": "2024-06-25",
        "amount": 1200,
        "reason": "Late delivery penalty",
        "status": "Approved"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.note_alt),
            SizedBox(width: 8),
            Text("Debit Notes / إشعارات مدينة"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              // الانتقال إلى إنشاء إشعار مدينة جديد
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
                hintText: "Search by note number or supplier...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ===== Notes List =====
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];

                  Color statusColor = Colors.orange;

                  if (note['status'] == "Approved") {
                    statusColor = Colors.green;
                  } else if (note['status'] == "Issued") {
                    statusColor = Colors.blue;
                  }

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Icon(Icons.note, color: Colors.white),
                      ),
                      title: Text(
                        note['number'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Icon(Icons.store, size: 16),
                              const SizedBox(width: 5),
                              Text("Supplier: ${note['supplier']}"),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Row(
                            children: [
                              const Icon(Icons.receipt, size: 16),
                              const SizedBox(width: 5),
                              Text("Related Bill: ${note['relatedBill']}"),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 5),
                              Text("Date: ${note['date']}"),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Row(
                            children: [
                              const Icon(Icons.attach_money, size: 16),
                              const SizedBox(width: 5),
                              Text("Amount: ${note['amount']} \$"),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Row(
                            children: [
                              const Icon(Icons.info_outline, size: 16),
                              const SizedBox(width: 5),
                              Text("Reason: ${note['reason']}"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            note['status'],
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {
                              // فتح تفاصيل الإشعار
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
        onPressed: () {
          // إنشاء إشعار جديد
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
