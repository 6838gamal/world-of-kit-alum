import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  Widget buildGroup(String title, IconData icon, List<Map<String, dynamic>> items, BuildContext context) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: items.map((item) {
        return ListTile(
          leading: Icon(item['icon'], color: Colors.black87),
          title: Text(item['title']),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, item['route']);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text("ERP System 📋", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),

          // المبيعات
          buildGroup('المبيعات', Icons.point_of_sale, [
            {'title': 'إدارة الفواتير', 'route': '/sales/invoices', 'icon': Icons.receipt_long},
            {'title': 'إنشاء فاتورة', 'route': '/sales/create-invoice', 'icon': Icons.add_box},
            {'title': 'عروض الأسعار', 'route': '/sales/quotes', 'icon': Icons.request_quote},
            {'title': 'إشعارات دائنة', 'route': '/sales/credit-note', 'icon': Icons.credit_score},
            {'title': 'الفواتير المرتجعة', 'route': '/sales/returned', 'icon': Icons.assignment_return},
            {'title': 'الفواتير الدورية', 'route': '/sales/recurring', 'icon': Icons.update},
            {'title': 'مدفوعات العملاء', 'route': '/sales/payments', 'icon': Icons.payments},
            {'title': 'إعدادات المبيعات', 'route': '/sales/settings', 'icon': Icons.settings},
          ], context),

          // العملاء
          buildGroup('العملاء', Icons.people, [
            {'title': 'إدارة العملاء', 'route': '/customers/manage', 'icon': Icons.supervisor_account},
            {'title': 'إضافة عميل', 'route': '/customers/add', 'icon': Icons.person_add_alt_1},
            {'title': 'قائمة الاتصال', 'route': '/customers/contacts', 'icon': Icons.contact_phone},
            {'title': 'إعدادات العميل', 'route': '/customers/settings', 'icon': Icons.settings},
          ], context),

          // المخزون
          buildGroup('المخزون', Icons.inventory_2, [
            {'title': 'المنتجات والخدمات', 'route': '/inventory/products', 'icon': Icons.category},
            {'title': 'الأذون المخزنية', 'route': '/inventory/transactions', 'icon': Icons.qr_code},
            {'title': 'قوائم الأسعار', 'route': '/inventory/prices', 'icon': Icons.price_check},
            {'title': 'المستودعات', 'route': '/inventory/warehouses', 'icon': Icons.warehouse},
            {'title': 'الجرد', 'route': '/inventory/stocktaking', 'icon': Icons.fact_check},
            {'title': 'إعدادات المخزون', 'route': '/inventory/settings', 'icon': Icons.settings},
          ], context),

          // المشتريات
          buildGroup('المشتريات', Icons.shopping_cart, [
            {'title': 'فواتير الشراء', 'route': '/purchases/bills', 'icon': Icons.receipt},
            {'title': 'مرتجعات المشتريات', 'route': '/purchases/returns', 'icon': Icons.assignment_return},
            {'title': 'إشعارات مدينة', 'route': '/purchases/debit-note', 'icon': Icons.note_alt},
            {'title': 'الموردين', 'route': '/purchases/suppliers', 'icon': Icons.local_shipping},
            {'title': 'مدفوعات الموردين', 'route': '/purchases/payments', 'icon': Icons.payments},
            {'title': 'إعدادات المشتريات', 'route': '/purchases/settings', 'icon': Icons.settings},
          ], context),

          // المالية
          buildGroup('المالية', Icons.account_balance_wallet, [
            {'title': 'المصروفات', 'route': '/finance/expenses', 'icon': Icons.money_off},
            {'title': 'سندات القبض', 'route': '/finance/receipts', 'icon': Icons.receipt_long},
            {'title': 'الخزائن والبنوك', 'route': '/finance/banks', 'icon': Icons.account_balance},
          ], context),

          // الحسابات العامة
          buildGroup('الحسابات العامة', Icons.account_balance, [
            {'title': 'القيود اليومية', 'route': '/accounting/journal', 'icon': Icons.book},
            {'title': 'دليل الحسابات', 'route': '/accounting/chart', 'icon': Icons.menu_book},
            {'title': 'مراكز التكلفة', 'route': '/accounting/cost', 'icon': Icons.label},
            {'title': 'الأصول', 'route': '/accounting/assets', 'icon': Icons.account_tree},
          ], context),

          // الموظفين
          buildGroup('الموظفين', Icons.people_alt, [
            {'title': 'إدارة الموظفين', 'route': '/employees/manage', 'icon': Icons.person},
            {'title': 'الأدوار والصلاحيات', 'route': '/employees/roles', 'icon': Icons.security},
          ], context),

          // التقارير
          buildGroup('التقارير', Icons.bar_chart, [
            {'title': 'تقارير المبيعات', 'route': '/reports/sales', 'icon': Icons.point_of_sale},
            {'title': 'تقارير المشتريات', 'route': '/reports/purchases', 'icon': Icons.shopping_cart},
            {'title': 'تقارير الحسابات', 'route': '/reports/accounting', 'icon': Icons.account_balance},
            {'title': 'تقارير العملاء', 'route': '/reports/customers', 'icon': Icons.people},
            {'title': 'تقارير المخزون', 'route': '/reports/inventory', 'icon': Icons.inventory_2},
            {'title': 'سجل النشاط', 'route': '/reports/activity', 'icon': Icons.history},
          ], context),

          // القوالب
          buildGroup('القوالب', Icons.description, [
            {'title': 'قوالب الطباعة', 'route': '/templates/print', 'icon': Icons.print},
            {'title': 'قوالب الفواتير', 'route': '/templates/invoices', 'icon': Icons.receipt_long},
            {'title': 'قوالب البريد الإلكتروني', 'route': '/templates/emails', 'icon': Icons.email},
            {'title': 'الشروط والأحكام', 'route': '/templates/terms', 'icon': Icons.rule},
            {'title': 'إدارة الملفات', 'route': '/templates/files', 'icon': Icons.folder},
            {'title': 'الإرسال الآلي', 'route': '/templates/automation', 'icon': Icons.autorenew},
          ], context),

          // الإعدادات
          buildGroup('الإعدادات', Icons.settings, [
            {'title': 'معلومات الحساب', 'route': '/settings/account', 'icon': Icons.account_circle},
            {'title': 'إعدادات SMTP', 'route': '/settings/smtp', 'icon': Icons.email},
            {'title': 'طرق الدفع', 'route': '/settings/payments', 'icon': Icons.payment},
            {'title': 'الضرائب', 'route': '/settings/tax', 'icon': Icons.calculate},
            {'title': 'الترقيم المتسلسل', 'route': '/settings/serial', 'icon': Icons.format_list_numbered},
            {'title': 'الشعار والألوان', 'route': '/settings/theme', 'icon': Icons.color_lens},
            {'title': 'API', 'route': '/settings/api', 'icon': Icons.code},
          ], context),
        ],
      ),
    );
  }
}
