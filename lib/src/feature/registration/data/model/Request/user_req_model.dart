class UserReqModel {
  final String username;
  final String email;
  final String password;

  UserReqModel({required this.username, required this.email, required this.password});

  factory UserReqModel.fromJson(Map<String, dynamic> json) {
    return UserReqModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}