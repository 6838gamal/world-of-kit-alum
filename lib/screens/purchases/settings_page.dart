import 'package:flutter/material.dart';

class PurchasesSettingsPage extends StatefulWidget {
  const PurchasesSettingsPage({super.key});

  @override
  State<PurchasesSettingsPage> createState() => _PurchasesSettingsPageState();
}

class _PurchasesSettingsPageState extends State<PurchasesSettingsPage> {
  bool autoNumbering = true;
  bool allowNegativeStock = false;
  bool sendEmailAfterPurchase = true;
  bool enableReturns = true;

  String defaultCurrency = 'YER';
  String defaultWarehouse = 'Main Warehouse';
  String defaultPaymentMethod = 'Cash';

  final List<String> currencies = ['YER', 'USD', 'SAR'];
  final List<String> warehouses = ['Main Warehouse', 'Branch A', 'Branch B'];
  final List<String> paymentMethods = ['Cash', 'Bank Transfer', 'Credit'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 8),
            Text('Purchases Settings / إعدادات المشتريات'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'General Settings / إعدادات عامة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          SwitchListTile(
            secondary: const Icon(Icons.confirmation_number),
            title: const Text('Auto numbering for bills'),
            subtitle: const Text('تفعيل الترقيم التلقائي لفواتير الشراء'),
            value: autoNumbering,
            onChanged: (val) => setState(() => autoNumbering = val),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.warning_amber),
            title: const Text('Allow negative stock'),
            subtitle: const Text('السماح بالمخزون السالب'),
            value: allowNegativeStock,
            onChanged: (val) => setState(() => allowNegativeStock = val),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.email),
            title: const Text('Send email after purchase bill'),
            subtitle: const Text('إرسال بريد بعد إنشاء فاتورة شراء'),
            value: sendEmailAfterPurchase,
            onChanged: (val) => setState(() => sendEmailAfterPurchase = val),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.assignment_return),
            title: const Text('Enable purchase returns'),
            subtitle: const Text('تفعيل مرتجعات المشتريات'),
            value: enableReturns,
            onChanged: (val) => setState(() => enableReturns = val),
          ),

          const Divider(height: 40),

          const Text(
            'Default Settings / الإعدادات الافتراضية',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(Icons.monetization_on),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Default currency / العملة الافتراضية',
                  ),
                  value: defaultCurrency,
                  items: currencies
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (val) => setState(() => defaultCurrency = val!),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(Icons.warehouse),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Default warehouse / المستودع الافتراضي',
                  ),
                  value: defaultWarehouse,
                  items: warehouses
                      .map((w) => DropdownMenuItem(value: w, child: Text(w)))
                      .toList(),
                  onChanged: (val) => setState(() => defaultWarehouse = val!),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(Icons.credit_card),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Default payment method / طريقة الدفع الافتراضية',
                  ),
                  value: defaultPaymentMethod,
                  items: paymentMethods
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (val) => setState(() => defaultPaymentMethod = val!),
                ),
              ),
            ],
          ),

          const Divider(height: 40),

          const Text(
            'Save changes / حفظ الإعدادات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Purchases settings saved successfully ✅')),
              );
            },
            icon: const Icon(Icons.save),
            label: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Save Settings / حفظ الإعدادات'),
            ),
          ),
        ],
      ),
    );
  }
}
