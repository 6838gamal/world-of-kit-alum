import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "All";
  String selectedStock = "All";

  final List<String> categories = ["All", "Electronics", "Accessories", "Office", "Other"];
  final List<String> stockStatus = ["All", "Available", "Low", "Out"];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Laptop Dell",
      "code": "P-1001",
      "sku": "DL-001",
      "barcode": "458965214785",
      "category": "Electronics",
      "supplier": "Tech Supplier",
      "location": "A1 - Shelf 2",
      "price": 450,
      "cost": 380,
      "profit": 70,
      "qty": 12,
      "reorder": 5,
      "status": "Active",
      "created": "2025-01-10",
      "updated": "2025-02-01",
    },
    {
      "name": "Wireless Mouse",
      "code": "P-1002",
      "sku": "MS-201",
      "barcode": "885412369875",
      "category": "Accessories",
      "supplier": "Mega Store",
      "location": "B2 - Shelf 1",
      "price": 10,
      "cost": 7,
      "profit": 3,
      "qty": 3,
      "reorder": 10,
      "status": "Low",
      "created": "2025-01-15",
      "updated": "2025-02-10",
    },
    {
      "name": "Printer HP",
      "code": "P-1003",
      "sku": "PR-546",
      "barcode": "968574123658",
      "category": "Office",
      "supplier": "Office World",
      "location": "C1 - Shelf 4",
      "price": 150,
      "cost": 120,
      "profit": 30,
      "qty": 0,
      "reorder": 2,
      "status": "Out",
      "created": "2025-01-20",
      "updated": "2025-02-15",
    },
  ];

  Color stockColor(int qty){
    if(qty == 0) return Colors.red;
    if(qty <= 5) return Colors.orange;
    return Colors.green;
  }

  String stockText(int qty){
    if(qty == 0) return "Out of stock";
    if(qty <= 5) return "Low";
    return "Available";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.inventory_2),
            SizedBox(width: 8),
            Text("Products Management / إدارة المنتجات"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال لصفحة إضافة منتج
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Product"),
      ),
      body: Column(
        children: [
          // ===== Stats =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatsCard(title: "Products", value: "3", icon: Icons.inventory),
                StatsCard(title: "Low Stock", value: "1", icon: Icons.warning),
                StatsCard(title: "Out", value: "1", icon: Icons.error),
              ],
            ),
          ),
          // ===== Search =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search product...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 10),
          // ===== Filters =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Category filter
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedCategory,
                    items: categories.map((cat) {
                      return DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.category),
                      labelText: "Category",
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Stock filter
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedStock,
                    items: stockStatus.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.storage),
                      labelText: "Stock Status",
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedStock = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // ===== Table/Header =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text("Product")),
                Expanded(flex: 2, child: Text("Code")),
                Expanded(flex: 2, child: Text("Barcode")),
                Expanded(flex: 2, child: Text("Supplier")),
                Expanded(flex: 2, child: Text("Location")),
                Expanded(flex: 1, child: Text("Qty")),
                Expanded(flex: 2, child: Text("Price")),
                Expanded(flex: 2, child: Text("Status")),
                Expanded(flex: 2, child: Text("Actions")),
              ],
            ),
          ),
          const Divider(),
          // ===== List =====
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                // Search filter
                if(searchController.text.isNotEmpty &&
                    !item["name"].toLowerCase().contains(searchController.text.toLowerCase())){
                  return const SizedBox();
                }
                // Category filter
                if(selectedCategory != "All" && item["category"] != selectedCategory){
                  return const SizedBox();
                }
                // Stock filter
                if(selectedStock == "Available" && item["qty"] <= 5) return const SizedBox();
                if(selectedStock == "Low" && !(item["qty"] > 0 && item["qty"] <= 5)) return const SizedBox();
                if(selectedStock == "Out" && item["qty"] != 0) return const SizedBox();

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(item["name"])),
                        Expanded(flex: 2, child: Text(item["code"])),
                        Expanded(flex: 2, child: Text(item["barcode"])),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const Icon(Icons.local_shipping, size: 16),
                              const SizedBox(width: 4),
                              Text(item["supplier"]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, size: 16),
                              const SizedBox(width: 4),
                              Text(item["location"]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item["qty"]}"),
                              Text("Min: ${item["reorder"]}", style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\$${item["price"]}"),
                              Text("Profit: ${item["profit"]}", style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: item["status"] == "Active"
                                    ? Colors.green
                                    : item["status"] == "Low"
                                        ? Colors.orange
                                        : Colors.red,
                              ),
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

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 5),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
