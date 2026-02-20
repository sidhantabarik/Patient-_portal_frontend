import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/department.dart';

class DoctorConsultPage extends StatefulWidget {
  const DoctorConsultPage({super.key});

  @override
  State<DoctorConsultPage> createState() => _DoctorConsultPageState();
}

class _DoctorConsultPageState extends State<DoctorConsultPage> {
  final TextEditingController searchController = TextEditingController();

  List<Department> departments = [];
  bool isLoading = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> searchDepartment() async {
    final query = searchController.text.trim();

    if (query.isEmpty) {
      setState(() => departments = []);
      return;
    }

    setState(() => isLoading = true);

    try {
      final result = await ApiService.getDepartments(query);

      if (!mounted) return;

      setState(() {
        departments = result;
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    if (!mounted) return;
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Consult"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🔍 SEARCH BAR
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Department (e.g. Cardiology)",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => searchDepartment(),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: searchDepartment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Search"),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 RESULTS
            if (isLoading)
              const CircularProgressIndicator()
            else if (departments.isEmpty)
              const Text("Search for departments")
            else
              Expanded(
                child: ListView.builder(
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    final dept = departments[index];

                    return Card(
                      child: ListTile(
                        title: Text(dept.departmentName),
                        subtitle: Text("Code: ${dept.departmentCode}"),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
