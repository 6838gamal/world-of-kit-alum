import 'package:flutter/material.dart';

class PricesPage extends StatefulWidget {
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> priceLists = [
    {
      "name": "Retail Price",
      "currency": "USD",
      "type": "Fixed",
      "products_count": 25,
      "created": "2025-01-05",
      "updated": "2025-02-01",
      "status": "Active",
    },
    {
      "name": "Wholesale Price",
      "currency": "USD",
      "type": "Percentage",
      "products_count": 15,
      "created": "2025-01-10",
      "updated": "2025-02-10",
      "status": "Active",
    },
    {
      "name": "Promo Price",
      "currency": "USD",
      "type": "Discount",
      "products_count": 5,
      "created": "2025-01-20",
      "updated": "2025-02-15",
      "status": "Inactive",
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
            Icon(Icons.price_change),
            SizedBox(width: 8),
            Text("Price Lists / قوائم الأسعار"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال لصفحة إضافة قائمة سعر جديدة
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Price List"),
      ),
      body: Column(
        children: [
          // ===== Search =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search price list...",
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
                Expanded(flex: 1, child: Text("Type")),
                Expanded(flex: 1, child: Text("Currency")),
                Expanded(flex: 1, child: Text("Products")),
                Expanded(flex: 2, child: Text("Created")),
                Expanded(flex: 2, child: Text("Updated")),
                Expanded(flex: 1, child: Text("Status")),
                Expanded(flex: 2, child: Text("Actions")),
              ],
            ),
          ),
          const Divider(),
          // ===== List =====
          Expanded(
            child: ListView.builder(
              itemCount: priceLists.length,
              itemBuilder: (context, index){
                final item = priceLists[index];

                // Search filter
                if(searchController.text.isNotEmpty &&
                   !item["name"].toLowerCase().contains(searchController.text.toLowerCase())){
                  return const SizedBox();
                }

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(item["name"])),
                        Expanded(flex: 1, child: Text(item["type"])),
                        Expanded(flex: 1, child: Text(item["currency"])),
                        Expanded(flex: 1, child: Text("${item["products_count"]}")),
                        Expanded(flex: 2, child: Text(item["created"])),
                        Expanded(flex: 2, child: Text(item["updated"])),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: statusColor(item["status"])),
                              const SizedBox(width: 5),
                              Text(item["status"]),
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
