import 'package:flutter/material.dart';

class InventorySettingsPage extends StatefulWidget {
  const InventorySettingsPage({super.key});

  @override
  State<InventorySettingsPage> createState() => _InventorySettingsPageState();
}

class _InventorySettingsPageState extends State<InventorySettingsPage> {
  bool allowNegativeStock = false;
  bool autoGenerateProductCode = true;
  String defaultWarehouse = "Main Warehouse";

  final List<String> warehouses = ["Main Warehouse", "Branch B Storage", "Old Storage"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 8),
            Text("Inventory Settings / إعدادات المخزون"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // ===== Allow Negative Stock =====
            SwitchListTile(
              title: const Text("Allow Negative Stock / السماح بالكمية السالبة"),
              secondary: const Icon(Icons.remove_circle_outline),
              value: allowNegativeStock,
              onChanged: (value){
                setState(() { allowNegativeStock = value; });
              },
            ),
            const Divider(),
            // ===== Auto Generate Product Code =====
            SwitchListTile(
              title: const Text("Auto Generate Product Code / توليد كود المنتج تلقائياً"),
              secondary: const Icon(Icons.code),
              value: autoGenerateProductCode,
              onChanged: (value){
                setState(() { autoGenerateProductCode = value; });
              },
            ),
            const Divider(),
            // ===== Default Warehouse =====
            ListTile(
              leading: const Icon(Icons.warehouse),
              title: const Text("Default Warehouse / المستودع الافتراضي"),
              subtitle: Text(defaultWarehouse),
              trailing: DropdownButton<String>(
                value: defaultWarehouse,
                items: warehouses.map((wh) {
                  return DropdownMenuItem(
                    value: wh,
                    child: Text(wh),
                  );
                }).toList(),
                onChanged: (value){
                  setState(() { defaultWarehouse = value!; });
                },
              ),
            ),
            const Divider(),
            // ===== Inventory Alerts =====
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Inventory Alerts / تنبيهات المخزون"),
              subtitle: const Text("Manage alerts for low stock, expiry, etc."),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // الانتقال لصفحة إدارة التنبيهات
                },
              ),
            ),
            const Divider(),
            // ===== Units & Categories =====
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Units & Categories / الوحدات والفئات"),
              subtitle: const Text("Manage product units and categories"),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // الانتقال لصفحة إدارة الوحدات والفئات
                },
              ),
            ),
            const Divider(),
            // ===== Import/Export =====
            ListTile(
              leading: const Icon(Icons.upload_file),
              title: const Text("Import/Export / استيراد/تصدير المنتجات"),
              subtitle: const Text("Import or export inventory data in Excel/CSV"),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // الانتقال لصفحة الاستيراد والتصدير
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
