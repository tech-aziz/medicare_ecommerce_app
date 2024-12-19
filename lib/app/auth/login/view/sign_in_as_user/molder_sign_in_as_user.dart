class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

class LoginResponse {
  final bool status;
  final String message;
  final String? token;

  LoginResponse({required this.status, required this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json['status'],
        message: json['message'],
        token: json['token'],
      );
}
