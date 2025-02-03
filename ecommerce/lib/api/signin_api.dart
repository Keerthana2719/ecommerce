import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = "https://localhost:7013/api/Register/Login";

  static Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'Email': email,
          'Password': password,
        }),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': json.decode(response.body),
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'error': 'Invalid email or password',
        };
      } else {
        return {
          'success': false,
          'error': 'Something went wrong. Please try again.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'An error occurred. Please try again.',
      };
    }
  }
}
