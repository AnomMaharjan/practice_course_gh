import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.token,
    this.username,
    this.fullName,
    this.email,
    this.phone,
  });

  String token;
  String username;
  String fullName;
  String email;
  String phone;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    token: json["token"],
    username: json["username"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "username": username,
    "full_name": fullName,
    "email": email,
    "phone": phone,
  };
}
