class UserResModel {
  final String username;
  final String email;
  final String outCode;
  final String outMessage;

  UserResModel({required this.username, required this.email, required this.outCode,required this.outMessage});

  factory UserResModel.fromJson(Map<String, dynamic> json) {
    return UserResModel(
      username: json['username'],
      email: json['email'],
      outCode: json['outCode'],
        outMessage: json['outMessage']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'outCode': outCode,
      'outMessage': outMessage,
    };
  }
}