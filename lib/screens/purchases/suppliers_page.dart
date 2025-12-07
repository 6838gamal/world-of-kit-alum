import 'package:flutter/material.dart';

class SuppliersPage extends StatelessWidget {
  const SuppliersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.factory_outlined),
            SizedBox(width: 8),
            Text("إدارة الموردين"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1),
            tooltip: "إضافة مورد",
            onPressed: () {
              // TODO: Add new supplier
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: "بحث",
            onPressed: () {},
          ),
        ],
      ),

      // ================= BODY =================
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          _SupplierCard(
            name: "شركة المستقبل للتقنية",
            address: "تعز - شارع جمال",
            phone: "+967 771 234 567",
            email: "info@future-tech.com",
            totalPurchases: "1,250,000 ر.ي",
            pendingAmount: "150,000 ر.ي",
            lastInvoice: "INV-4503",
            lastPayment: "PAY-3302",
            bank: "بنك الكريمي",
            accountNumber: "123456789",
            isActive: true,
            ordersCount: 54,
          ),
          _SupplierCard(
            name: "مؤسسة الأمان التجارية",
            address: "صنعاء - الحصبة",
            phone: "+967 777 987 654",
            email: "sales@aman.com",
            totalPurchases: "620,000 ر.ي",
            pendingAmount: "80,000 ر.ي",
            lastInvoice: "INV-4410",
            lastPayment: "PAY-3288",
            bank: "بنك التضامن",
            accountNumber: "987654321",
            isActive: false,
            ordersCount: 28,
          ),
          _SupplierCard(
            name: "شركة الرواد الحديثة",
            address: "إب - النادرة",
            phone: "+967 770 111 222",
            email: "rawad@company.com",
            totalPurchases: "2,460,000 ر.ي",
            pendingAmount: "0 ر.ي",
            lastInvoice: "INV-4301",
            lastPayment: "PAY-3201",
            bank: "بنك سبأ",
            accountNumber: "654123987",
            isActive: true,
            ordersCount: 90,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_business),
        label: const Text("مورد جديد"),
      ),
    );
  }
}

class _SupplierCard extends StatelessWidget {
  final String name,
      address,
      phone,
      email,
      totalPurchases,
      pendingAmount,
      lastInvoice,
      lastPayment,
      bank,
      accountNumber;
  final bool isActive;
  final int ordersCount;

  const _SupplierCard({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.totalPurchases,
    required this.pendingAmount,
    required this.lastInvoice,
    required this.lastPayment,
    required this.bank,
    required this.accountNumber,
    required this.isActive,
    required this.ordersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== Header =====
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  child: Icon(Icons.factory),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(isActive ? "نشط" : "موقوف"),
                  backgroundColor:
                      isActive ? Colors.green.shade100 : Colors.red.shade100,
                  labelStyle: TextStyle(
                    color: isActive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(height: 20),

            // ===== Basic info =====
            Row(
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(address)),
              ],
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                const Icon(Icons.phone, size: 18),
                const SizedBox(width: 8),
                Text(phone),
              ],
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                const Icon(Icons.email, size: 18),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),

            const Divider(height: 20),

            // ===== Financial =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoColumn("إجمالي المشتريات", totalPurchases, Icons.shopping_cart),
                _InfoColumn("المبلغ المعلّق", pendingAmount, Icons.money_off),
                _InfoColumn("عدد الطلبات", ordersCount.toString(), Icons.numbers),
              ],
            ),

            const Divider(height: 20),

            // ===== Bank info =====
            Row(
              children: [
                const Icon(Icons.account_balance, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text("البنك: $bank")),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.credit_card, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text("رقم الحساب: $accountNumber")),
              ],
            ),

            const Divider(height: 20),

            // ===== Last Activity =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MiniInfo("آخر فاتورة", lastInvoice, Icons.receipt_long),
                _MiniInfo("آخر دفعة", lastPayment, Icons.payments),
              ],
            ),

            const SizedBox(height: 10),

            // ===== Buttons =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                  label: const Text("عرض"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text("تعديل"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_forever, color: Colors.red),
                  label: const Text(
                    "حذف",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoColumn(this.title, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _MiniInfo extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MiniInfo(this.title, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 12)),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
