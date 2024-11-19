import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiService {
  static const String baseUrl = 'https://mediadwi.com/api/latihan/';

  // Fungsi login dengan metode POST
  static Future<Map<String, dynamic>?> login(
      String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
