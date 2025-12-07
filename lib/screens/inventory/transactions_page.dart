import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedType = "All";
  String selectedStatus = "All";

  final List<String> types = ["All", "Incoming", "Outgoing", "Transfer"];
  final List<String> statuses = ["All", "Completed", "Pending", "Cancelled"];

  final List<Map<String, dynamic>> transactions = [
    {
      "id": "TR-001",
      "date": "2025-12-01",
      "type": "Incoming",
      "product": "Laptop Dell",
      "qty": 5,
      "from": "Supplier A",
      "to": "Main Warehouse",
      "status": "Completed",
      "notes": "New stock arrival",
    },
    {
      "id": "TR-002",
      "date": "2025-12-03",
      "type": "Outgoing",
      "product": "Wireless Mouse",
      "qty": 2,
      "from": "Main Warehouse",
      "to": "Branch B",
      "status": "Pending",
      "notes": "Transfer to branch",
    },
    {
      "id": "TR-003",
      "date": "2025-12-05",
      "type": "Incoming",
      "product": "Printer HP",
      "qty": 1,
      "from": "Supplier B",
      "to": "Main Warehouse",
      "status": "Cancelled",
      "notes": "Order cancelled by supplier",
    },
  ];

  Color statusColor(String status){
    switch(status){
      case "Completed": return Colors.green;
      case "Pending": return Colors.orange;
      case "Cancelled": return Colors.red;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.swap_horiz),
            SizedBox(width: 8),
            Text("Inventory Transactions / الأذون المخزنية"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال لإضافة إذن جديد
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Transaction"),
      ),
      body: Column(
        children: [
          // ===== Search =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search transaction...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) { setState(() {}); },
            ),
          ),
          // ===== Filters =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Type filter
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedType,
                    items: types.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.category),
                      labelText: "Type",
                    ),
                    onChanged: (value) {
                      setState(() { selectedType = value.toString(); });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Status filter
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedStatus,
                    items: statuses.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.info),
                      labelText: "Status",
                    ),
                    onChanged: (value) {
                      setState(() { selectedStatus = value.toString(); });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // ===== Table/Header =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text("ID")),
                Expanded(flex: 2, child: Text("Date")),
                Expanded(flex: 2, child: Text("Type")),
                Expanded(flex: 2, child: Text("Product")),
                Expanded(flex: 1, child: Text("Qty")),
                Expanded(flex: 2, child: Text("From")),
                Expanded(flex: 2, child: Text("To")),
                Expanded(flex: 2, child: Text("Status")),
                Expanded(flex: 2, child: Text("Actions")),
              ],
            ),
          ),
          const Divider(),
          // ===== List =====
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index){
                final t = transactions[index];

                // Search filter
                if(searchController.text.isNotEmpty &&
                   !t["id"].toLowerCase().contains(searchController.text.toLowerCase()) &&
                   !t["product"].toLowerCase().contains(searchController.text.toLowerCase())){
                  return const SizedBox();
                }

                // Type filter
                if(selectedType != "All" && t["type"] != selectedType) return const SizedBox();

                // Status filter
                if(selectedStatus != "All" && t["status"] != selectedStatus) return const SizedBox();

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(t["id"])),
                        Expanded(flex: 2, child: Text(t["date"])),
                        Expanded(flex: 2, child: Text(t["type"])),
                        Expanded(flex: 2, child: Text(t["product"])),
                        Expanded(flex: 1, child: Text("${t["qty"]}")),
                        Expanded(flex: 2, child: Text(t["from"])),
                        Expanded(flex: 2, child: Text(t["to"])),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: statusColor(t["status"])),
                              const SizedBox(width: 5),
                              Text(t["status"]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
                              IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                              IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
