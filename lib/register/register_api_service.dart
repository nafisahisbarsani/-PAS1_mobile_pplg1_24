import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterApiService{
  static const String baseUrl = 'https://mediadwi.com/api/latihan/';

  // Fungsi register dengan metode POST
  static Future<Map<String, dynamic>?> register(
      String username, String password, String fullName, String email) async {
    final url = Uri.parse('$baseUrl/register-user');
    final response = await http.post(url, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'username': username,
      'password': password,
      'full_name': fullName,
      'email': email,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}