import 'package:flutter/material.dart';

class WarehousesPage extends StatefulWidget {
  const WarehousesPage({super.key});

  @override
  State<WarehousesPage> createState() => _WarehousesPageState();
}

class _WarehousesPageState extends State<WarehousesPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> warehouses = [
    {
      "name": "Main Warehouse",
      "location": "Building A",
      "capacity": 5000,
      "used_space": 3200,
      "manager": "Ahmed Ali",
      "status": "Active",
      "created": "2025-01-01",
      "updated": "2025-02-01",
    },
    {
      "name": "Branch B Storage",
      "location": "Branch B",
      "capacity": 2000,
      "used_space": 1500,
      "manager": "Sara Khalid",
      "status": "Active",
      "created": "2025-01-10",
      "updated": "2025-02-10",
    },
    {
      "name": "Old Storage",
      "location": "Building C",
      "capacity": 1000,
      "used_space": 0,
      "manager": "Not Assigned",
      "status": "Inactive",
      "created": "2024-12-01",
      "updated": "2025-01-20",
    },
  ];

  Color statusColor(String status){
    switch(status){
      case "Active": return Colors.green;
      case "Inactive": return Colors.red;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.warehouse),
            SizedBox(width: 8),
            Text("Warehouses / المستودعات"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال لإضافة مستودع جديد
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Warehouse"),
      ),
      body: Column(
        children: [
          // ===== Search =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search warehouse...",
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
          // ===== Table/Header =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text("Name")),
                Expanded(flex: 2, child: Text("Location")),
                Expanded(flex: 1, child: Text("Capacity")),
                Expanded(flex: 1, child: Text("Used")),
                Expanded(flex: 2, child: Text("Manager")),
                Expanded(flex: 1, child: Text("Status")),
                Expanded(flex: 2, child: Text("Actions")),
              ],
            ),
          ),
          const Divider(),
          // ===== List =====
          Expanded(
            child: ListView.builder(
              itemCount: warehouses.length,
              itemBuilder: (context, index){
                final w = warehouses[index];

                // Search filter
                if(searchController.text.isNotEmpty &&
                   !w["name"].toLowerCase().contains(searchController.text.toLowerCase())){
                  return const SizedBox();
                }

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(w["name"])),
                        Expanded(flex: 2, child: Text(w["location"])),
                        Expanded(flex: 1, child: Text("${w["capacity"]}")),
                        Expanded(flex: 1, child: Text("${w["used_space"]}")),
                        Expanded(flex: 2, child: Text(w["manager"])),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: statusColor(w["status"])),
                              const SizedBox(width: 5),
                              Text(w["status"]),
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
