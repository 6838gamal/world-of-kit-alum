import 'package:flutter/material.dart';
import 'layout/home_page.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ERP System',
      home: const HomePage(),
      routes: AppRoutes.routes,
    );
  }
}
