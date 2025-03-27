import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gitproj/utils/constants.dart';

class ApiService {
  static const String _apiKey = apiKey;
  static const String _baseUrl = baseUrl;

  static Future<List<dynamic>> fetchNews() async {
    final response = await http.get(
        Uri.parse('$_baseUrl/top-headlines?category=business&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
