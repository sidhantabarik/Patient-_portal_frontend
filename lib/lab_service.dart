import 'package:flutter/material.dart';

class LabServicePage extends StatelessWidget {
  const LabServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Services"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Lab Services Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
