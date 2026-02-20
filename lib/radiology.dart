import 'package:flutter/material.dart';

class RadiologyPage extends StatelessWidget {
  const RadiologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radiology Services"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Radiology Services Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
