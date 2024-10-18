import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/user_model.dart';

class ApiService {
  static const baseUrl = 'https://fa11-105-98-195-147.ngrok-free.app';

  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserModel.formJson(body);
    } else {
      return null;
    }
  }

  Future<UserModel?> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserModel.formJson(body);
    } else {
      return null;
    }
  }
}
