class RegistrationModel {
  final String storeName;
  final String ownerName;
  final String phone;
  final String email;
  final String password;
  final String address;
  final String licenseNumber;

  RegistrationModel({
    required this.storeName,
    required this.ownerName,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.licenseNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'store_name': storeName,
      'owner_name': ownerName,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
      'license_number': licenseNumber,
    };
  }
}
