class CompanyModel {
  final String id;
  final String name;
  final String description;
  final String status;
  final String branchId;
  final String imageName;

  CompanyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.branchId,
    required this.imageName,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      branchId: json['branch_id'] ?? '',
      imageName: json['image_name'] ?? '',
    );
  }
}
