class CompanyModel {
  final String id;
  final String name;
  final String description;
  final String status;
  final String branchId;

  CompanyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.branchId,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      branchId: json['branch_id'] ?? '',
    );
  }
}
