import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<bool> signup({
    required String username,
    required String email,
    required String mobile,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://localhost:7013/api/Register/Signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'UserName': username,
          'Email': email,
          'Mobile_Number': mobile,
          'Password': password,
        }),
      );

      if (response.statusCode == 200) {
        return true; 
      } else {
        return false;
      }
    } catch (e) {
      print("Error during API call: $e");
      return false;
    }
  }

  static loginUser(String email, String password) {}
}
