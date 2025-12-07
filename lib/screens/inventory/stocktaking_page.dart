import 'package:flutter/material.dart';

class StocktakingPage extends StatefulWidget {
  const StocktakingPage({super.key});

  @override
  State<StocktakingPage> createState() => _StocktakingPageState();
}

class _StocktakingPageState extends State<StocktakingPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedStatus = "All";
  final List<String> statuses = ["All", "Completed", "Pending", "Cancelled"];

  final List<Map<String, dynamic>> stocktakings = [
    {
      "id": "ST-001",
      "date": "2025-12-01",
      "warehouse": "Main Warehouse",
      "products_count": 120,
      "checked_by": "Ahmed Ali",
      "status": "Completed",
      "notes": "Monthly check",
    },
    {
      "id": "ST-002",
      "date": "2025-12-05",
      "warehouse": "Branch B Storage",
      "products_count": 50,
      "checked_by": "Sara Khalid",
      "status": "Pending",
      "notes": "Weekly inventory",
    },
    {
      "id": "ST-003",
      "date": "2025-12-07",
      "warehouse": "Main Warehouse",
      "products_count": 30,
      "checked_by": "Mohammed Saleh",
      "status": "Cancelled",
      "notes": "Cancelled due to missing staff",
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
            Icon(Icons.fact_check),
            SizedBox(width: 8),
            Text("Stocktaking / الجرد"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال لإضافة عملية جرد جديدة
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Stocktaking"),
      ),
      body: Column(
        children: [
          // ===== Search =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search stocktaking...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value){ setState(() {}); },
            ),
          ),
          const SizedBox(height: 10),
          // ===== Status Filter =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField(
              value: selectedStatus,
              items: statuses.map((status){
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.info),
                labelText: "Status",
              ),
              onChanged: (value){
                setState(() { selectedStatus = value.toString(); });
              },
            ),
          ),
          const SizedBox(height: 15),
          // ===== Table/Header =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text("ID")),
                Expanded(flex: 2, child: Text("Date")),
                Expanded(flex: 2, child: Text("Warehouse")),
                Expanded(flex: 1, child: Text("Products")),
                Expanded(flex: 2, child: Text("Checked By")),
                Expanded(flex: 2, child: Text("Status")),
                Expanded(flex: 2, child: Text("Actions")),
              ],
            ),
          ),
          const Divider(),
          // ===== List =====
          Expanded(
            child: ListView.builder(
              itemCount: stocktakings.length,
              itemBuilder: (context, index){
                final st = stocktakings[index];

                // Search filter
                if(searchController.text.isNotEmpty &&
                   !st["id"].toLowerCase().contains(searchController.text.toLowerCase()) &&
                   !st["warehouse"].toLowerCase().contains(searchController.text.toLowerCase())){
                  return const SizedBox();
                }

                // Status filter
                if(selectedStatus != "All" && st["status"] != selectedStatus) return const SizedBox();

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(st["id"])),
                        Expanded(flex: 2, child: Text(st["date"])),
                        Expanded(flex: 2, child: Text(st["warehouse"])),
                        Expanded(flex: 1, child: Text("${st["products_count"]}")),
                        Expanded(flex: 2, child: Text(st["checked_by"])),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: statusColor(st["status"])),
                              const SizedBox(width: 5),
                              Text(st["status"]),
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
