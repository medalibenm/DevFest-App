import 'package:http/http.dart' as http;
import 'package:my_therapist/utils/constants/api.dart';
import 'dart:convert';
import 'model/user_model.dart';

class ApiService {
  final baseUrl = Tapi.baseurl;

  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return UserModel.formJson(body);
    } else {
      return null;
    }
  }

  Future<UserModel?> register(
      String username, String password, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'username': username, 'email': email, "password": password}),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return UserModel.registerJson(body['user']);
    } else {
      return null;
    }
  }
}
