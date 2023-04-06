class ProfileResponse {
  ProfileResponse({
    required this.statusCode,
    required this.id,
    required this.fullname,
  });

  int statusCode;
  int id;
  String fullname;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    statusCode: json["statusCode"],
    id: json["id"],
    fullname: json["fullname"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "id": id,
    "fullname": fullname,
  };
}
