import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_flutter/constants/api_consts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/models'),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        print("jsonResponse['error']['message'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      print('jsonResponse $jsonResponse');
    } catch (error) {
      print('error $error');
    }
  }
}
