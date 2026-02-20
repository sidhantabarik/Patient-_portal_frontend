import 'package:flutter/material.dart';

class HealthCheckupPage extends StatelessWidget {
  const HealthCheckupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Checkup"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Health Checkup Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
