class Department {
  final int departmentId;
  final String departmentName;
  final String departmentCode;
  final int active;

  Department({
    required this.departmentId,
    required this.departmentName,
    required this.departmentCode,
    required this.active,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentId: json['department_id'] ?? 0,
      departmentName: json['department_name'] ?? "",
      departmentCode: json['department_code'] ?? "",
      active: json['active'] ?? 0,
    );
  }
}
