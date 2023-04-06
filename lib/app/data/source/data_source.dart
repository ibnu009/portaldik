import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:portaldik/app/data/response/profile_response.dart';

import '../network_service.dart';
import '../response/login_response.dart';

const String contentType = "Content-Type";
const String applicationJson = "application/json";
const String authorization = "Authorization";

class DataSource extends NetworkService {
  DataSource();

  final storage = const FlutterSecureStorage();

  DataSource._privateConstructor();

  static final DataSource _instance = DataSource._privateConstructor();

  static DataSource get instance => _instance;

  Future<LoginResponse> login(String username, String password) async {
    var header = {contentType: applicationJson};
    var body = {'username': username, 'password': password};
    var map = await postMethod("$BASE_URL/login", body: body, headers: header);
    return LoginResponse.fromJson(map);
  }

  Future<ProfileResponse> fetchProfile() async {
    String? token = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, authorization: "Bearer $token"};
    var map = await postMethodNoBody("$BASE_URL/student", headers: header);
    return ProfileResponse.fromJson(map);
  }

  Future<ProfileResponse> uploadImage(File image, String studentId) async {
    String? token = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, authorization: "Bearer $token"};
    var body = {'student_id': studentId};
    var file = {'images': image};
    var map = await multipartPost("$BASE_URL/captures",
        header: header, body: body, files: file);
    return ProfileResponse.fromJson(map);
  }

  Future<String?> readSecureData(String key) {
    var readData = storage.read(key: key);
    return readData;
  }

  Object writeSecureTokenData(String key, String value) {
    var writeData = storage.write(key: key, value: value);
    return writeData;
  }
}
