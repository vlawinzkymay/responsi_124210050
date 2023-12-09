import 'dart:convert';

import 'package:http/http.dart' as http;

class LoadData {
  static String baseURL = 'https://www.themealdb.com/api/json/v1/1/';

  static Future<Map<String, dynamic>>get(String parameter) async {
    final response = await http.get(Uri.parse('$baseURL/$parameter'));
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception('Failed to load data');
    }
  }
}