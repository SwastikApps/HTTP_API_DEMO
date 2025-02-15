import 'package:http_api_demo/carts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// Import your model class

class ApiService {
  static const String apiUrl =
      "https://dummyjson.com/carts"; // Replace with your API

  // Fetch carts from API
  Future<List<Carts>> fetchCarts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse JSON response
      final List<dynamic> jsonData = json.decode(response.body)['carts'];
      return jsonData.map((json) => Carts.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load carts");
    }
  }
}
