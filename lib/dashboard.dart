import 'package:flutter/material.dart';
import 'doctor_consult.dart';
import 'lab_service.dart';
import 'radiology.dart';
import 'health_checkup.dart';
import 'order_medicine.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ServiceModel(
        "Doctor Consult",
        Icons.local_hospital,
        Colors.orange,
        const DoctorConsultPage(),
      ),
      ServiceModel(
        "Lab Services",
        Icons.science,
        Colors.blue,
        const LabServicePage(),
      ),
      ServiceModel(
        "Radiology",
        Icons.medical_services,
        Colors.purple,
        const RadiologyPage(),
      ),
      ServiceModel(
        "Health Checkup",
        Icons.health_and_safety,
        Colors.red,
        const HealthCheckupPage(),
      ),
      ServiceModel(
        "Order Medicines",
        Icons.medication,
        Colors.green,
        const OrderMedicinePage(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Patient Dashboard"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OUR SERVICES",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: services
                  .map((service) => ServiceCard(service: service))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= MODEL ================= */

class ServiceModel {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  const ServiceModel(this.title, this.icon, this.color, this.page);
}

/* ================= REUSABLE CARD ================= */

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => service.page),
        );
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: service.color.withAlpha(40),
              child: Icon(service.icon, size: 25, color: service.color),
            ),
            const SizedBox(height: 10),
            Text(
              service.title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
