import 'package:my_therapist/features/Authentification/Authapi.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepo {
  final FlutterSecureStorage storage = FlutterSecureStorage();

 Future Login(String username, String password) async {
    final user = await ApiService().login(username, password);
    if (user != null && user.token.isNotEmpty) {
      await storage.write(key: 'token', value: user.token);
      return true;
    }
    return false;
  }

  Future Register(String username, String password) async {
    final user = await ApiService().login(username, password);
    if (user != null && user.token.isNotEmpty) {
      await storage.write(key: 'token', value: user.token);
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> getHeader() async {
    final token = await storage.read(key: 'token');
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }
}