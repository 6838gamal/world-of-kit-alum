import 'package:flutter/material.dart';

class SmtpPage extends StatelessWidget {
  const SmtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.mail),
            SizedBox(width: 8),
            Text("SMTP Settings / إعدادات البريد"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                labelText: "SMTP Server",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.settings_input_component),
                labelText: "Port",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              onPressed: () {},
              label: const Text("حفظ"),
            )
          ],
        ),
      ),
    );
  }
}
