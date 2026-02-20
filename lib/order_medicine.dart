import 'package:flutter/material.dart';

class OrderMedicinePage extends StatelessWidget {
  const OrderMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Medicines"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Order Medicine Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
