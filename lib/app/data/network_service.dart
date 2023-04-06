import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';

const BASE_URL = 'https://ab79-103-156-141-122.ap.ngrok.io';

abstract class NetworkService {
  final logger = Logger(printer: PrettyPrinter());

  Future<dynamic> postMethodNoBody(String endpoint,
      { Map<String, String>? headers}) async {
    try {
      final response = await http.post(Uri.parse(endpoint), headers: headers);
      Map<String, dynamic> res = jsonDecode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> postMethod(String endpoint,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      final response = await http.post(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      Map<String, dynamic> res = jsonDecode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> multipartPost(String endpoint,
      {Map<String, String>? body,
        Map<String, String>? header,
        Map<String, File>? files}) async {
    try {
      var uri = Uri.parse(endpoint);
      var request = http.MultipartRequest("POST", uri);

      if (files!.isNotEmpty) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path,
              contentType: MediaType('image', '*')));
        });
      }

      if (header != null) request.headers.addAll(header);
      if (body != null) request.fields.addAll(body);

      var response = await request.send().then(http.Response.fromStream);
      var res = jsonDecode(response.body);
      logger.d(res);
      return res;

    } on SocketException {
      throw Exception("Connection Failed");
    }
  }
}
