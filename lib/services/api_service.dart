import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/department.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8080/general";

  static Future<List<Department>> getDepartments(String searchText) async {
    final response = await http.get(
      Uri.parse("$baseUrl/getAllDepartments?searchText=$searchText"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Department.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load departments");
    }
  }
}
