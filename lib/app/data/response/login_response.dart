class LoginResponse {
  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.token,
  });

  int statusCode;
  String message;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "token": token,
  };
}
